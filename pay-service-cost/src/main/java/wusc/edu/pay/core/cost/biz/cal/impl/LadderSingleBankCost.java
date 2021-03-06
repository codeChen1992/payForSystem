package wusc.edu.pay.core.cost.biz.cal.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import wusc.edu.pay.core.cost.biz.CalFeeFlowBiz;
import wusc.edu.pay.core.cost.biz.cal.abs.LadderBankCost;
import wusc.edu.pay.facade.cost.entity.CalCostOrder;
import wusc.edu.pay.facade.cost.entity.CalFeeRateFormula;
import wusc.edu.pay.facade.cost.entity.CalFeeWay;
import wusc.edu.pay.facade.cost.enums.CalModelEnum;
import wusc.edu.pay.facade.cost.exceptions.CostBizException;

/**
 * 计费方式：区间计费
 * @author yzyue
 *
 */
public class LadderSingleBankCost extends LadderBankCost {

	public LadderSingleBankCost(CalCostOrder order,
			CalFeeFlowBiz calFeeFlowBiz, CalFeeWay calFeeWay, Date date) {
		super(order, calFeeFlowBiz, calFeeWay, date);
	}

	@Override
	public boolean calculate(List<CalFeeRateFormula> formulas)
			throws CostBizException {
		try{
			this.inital();
			BigDecimal totalAmount = this.amount;
			if(this.calFeeFlow != null && this.calFeeFlow.getTotalAmount() != null){
				totalAmount = totalAmount.add(this.calFeeFlow.getTotalAmount());
			}
			int formulaCount = (formulas == null) ? 0 : formulas.size();
			if(formulaCount == 0){
				logger.warn("计费约束中找不到计费公式");
				return false;
			}
			BigDecimal fee = BigDecimal.ZERO;
			for(int i = 0; i < formulaCount; i++){
				CalFeeRateFormula formula = formulas.get(i);
				logger.info(String.format("判断当前交易总流量[%s]是否在该阶梯[%s - %s]之内", totalAmount, formula.getMinLadderAmount(), formula.getMaxLadderAmount()));
				if(formula.getMinLadderAmount() == null){
					logger.error("计费公式中，阶梯下限为空");
					continue;
				}
				if(formula.getMaxLadderAmount() == null){
					logger.error("计费公式中，阶梯上限为空");
					continue;
				}
				if(formula.getMinLadderAmount().compareTo(formula.getMaxLadderAmount()) == 1){
					logger.error("计费公式中阶梯上下限设置有误");
					continue;
				}
				if(totalAmount.compareTo(formula.getMinLadderAmount()) == -1 || totalAmount.compareTo(formula.getMaxLadderAmount()) == 1){
					logger.info("当前交易总流量不在此阶梯之内");
					continue;
				}else{
					if(formula.getModel().intValue() == CalModelEnum.PERCENT.getValue()){
						logger.info(String.format("验证计费公式[%d/%d],模式=[比例],费率=[%s],最低手续费=[%s],最高手续费=[%s]", i + 1, formulaCount, formula.getPercentFee(), formula.getSingleMinFee(), formula.getSingleMaxFee()));
						if(formula.getSingleMinFee() == null){
							logger.error("计费公式中，最低手续费为空");
							continue;
						}
						if(formula.getSingleMaxFee() == null){
							logger.error("计费公式中，最高手续费为空");
							continue;
						}
						if(formula.getPercentFee() == null){
							logger.error("计费公式中，费率比例为空");
							continue;
						}
						if(formula.getSingleMinFee().compareTo(formula.getSingleMaxFee()) == 1){
							logger.error(String.format("计费公式中最低手续费[%s]和最高手续费[%s]设置有误", formula.getSingleMinFee(), formula.getSingleMaxFee()));
						}
						this.fee = amount.multiply(formula.getPercentFee());
						if(this.fee.compareTo(formula.getSingleMinFee()) == -1){
							this.fee = formula.getSingleMinFee();
							order.setCalExpression("单阶梯比例:" + amount + " * " + formula.getPercentFee() + " ;取最低: " + formula.getSingleMinFee());
						}else if(this.fee.compareTo(formula.getSingleMaxFee()) == 1){
							this.fee = formula.getSingleMaxFee();
							order.setCalExpression("单阶梯比例:" + amount + " * " + formula.getPercentFee() + " ;取最高: " + formula.getSingleMaxFee());
						}else{
							order.setCalExpression("单阶梯比例:" + amount + " * " + formula.getPercentFee());	
						}
						return true;
					}else{
						logger.info(String.format("验证计费公式[%d/%d],模式=[固定金额],固定手续费=[%s]", i + 1, formulaCount, formula.getFixedFee()));
						if(formula.getFixedFee() == null){
							logger.error("计费公式中，固定手续费为空");
							continue;
						}else{
							this.fee = formula.getFixedFee();
							order.setCalExpression("单阶梯固定:" + formula.getFixedFee());
							return true;
						}
					}
				}
			}
			logger.warn("计费约束中找不到有效的计费公式");
			return false;
		}catch(CostBizException e){
			logger.error("计算单阶梯成本出现异常", e);
			return false;
		}
	}

}
