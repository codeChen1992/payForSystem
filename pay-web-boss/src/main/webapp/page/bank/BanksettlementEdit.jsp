<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/inc/taglib.jsp"%>
<div class="pageContent">
	<form id="form" method="post" action="banksettlement_editBanksettlement.action" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
		    <input type="hidden" name="navTabId" value="list">
			<input type="hidden" name="callbackType" value="closeCurrent">
			<input type="hidden" name="forwardUrl" value="">
			<input type="hidden" name="id" value="${model.id }" id="id">
			<input type="hidden" name="version"value="${model.version }"> 
						<div class="unit">
							<label style="width: 20%;text-align: right;">银行渠道：</label>
							<input type="text" name="bankChannelCode" value="${model.bankChannelCode }" readonly="true" minlength="1" maxlength="25" size="30" style="width: 50%"  />
							<%-- <s:textfield name="bankChannelCode" value="%{model.bankChannelCode}" minlength="1" cssClass="required" readonly="true" maxlength="50" style="width: 50%" /> --%>
						</div>
						<div class="unit">
							<label style="width: 20%;text-align: right;">结算周期：</label>
							<s:textfield name="settleCycle" value="%{model.settleCycle}" cssClass="required digits" minlength="1" maxlength="3" style="width: 50%" /><span class="info">单位：天</span>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">手续费账户：</label>
							<s:textfield name="chargeAccount" value="%{model.chargeAccount }" cssClass="required digits" minlength="12" maxlength="19" style="width: 50%" />
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">保证金账户：</label>
							<s:textfield name="marginAccount" value="%{model.marginAccount }" cssClass="required digits" minlength="12" maxlength="19" style="width: 50%"/>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">手续费扣收方式：</label>
							<label><input type="radio" <c:if test="${model.chargeDeductWay eq 1 }">checked="checked"</c:if> name="chargeDeductWay" value="1">内扣</label>
							<label><input type="radio" <c:if test="${model.chargeDeductWay eq 2 }">checked="checked"</c:if> name="chargeDeductWay" value="2">外扣</label>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">手续费扣收周期：</label>	
							<label><input type="radio" <c:if test="${model.chargeDeductCycle eq 1 }">checked="checked"</c:if> name="chargeDeductCycle" value="1">实时</label>
							<label><input type="radio" <c:if test="${model.chargeDeductCycle eq 2 }">checked="checked"</c:if> name="chargeDeductCycle" value="2">包年</label>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">手续费支付方式：</label>
							<label><input type="radio" <c:if test="${model.chargePayWay eq 1 }">checked="checked"</c:if> name="chargePayWay" value="1">自动扣帐</label>
							<label><input type="radio" <c:if test="${model.chargePayWay eq 2 }">checked="checked"</c:if> name="chargePayWay" value="2">人工转账</label>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">退款方式：</label>
							<label><input type="radio" <c:if test="${model.refoundType eq 1 }">checked="checked"</c:if> name="refoundType" value="1">内扣</label>
							<label><input type="radio" <c:if test="${model.refoundType eq 2 }">checked="checked"</c:if> name="refoundType" value="2">外扣</label>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">退款扣收方式：</label>
							<select name="refoundDeductWay" class="combox">
								<option value="0">请选择</option>
								<option <c:if test="${model.refoundDeductWay eq 1 }">selected="selected"</c:if> value="1">接口</option>
								<option <c:if test="${model.refoundDeductWay eq 2 }">selected="selected"</c:if> value="2">网银</option>
								<option <c:if test="${model.refoundDeductWay eq 3 }">selected="selected"</c:if> value="3">传真</option>
								<option <c:if test="${model.refoundDeductWay eq 4 }">selected="selected"</c:if> value="4">邮件</option>
								<option <c:if test="${model.refoundDeductWay eq 5 }">selected="selected"</c:if> value="5">邮寄</option>
							</select>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">退款有效期：</label>
							<s:textfield name="refoundValidity" value="%{model.refoundValidity}" cssClass="required digits" minlength="1" maxlength="3" style="width: 50%" /><span class="info">单位：天</span>
						</div>
						<div class="unit">
<%-- 						<label style="width: 20%;text-align: right;">是否支持部分退款：</label>
							<label><input type="radio" name="isRabates" <c:if test="${model.isRabates eq 1 }">checked="checked"</c:if> value="1">是</label>
							<label><input type="radio" name="isRabates" <c:if test="${model.isRabates eq 2 }">checked="checked"</c:if> value="2">否</label>
						</div> --%>
						<div class="unit">
						<label style="width: 20%;text-align: right;">是否退回手续费：</label>
							<label><input type="radio" <c:if test="${model.isReturnCharge eq 1 }">checked="checked"</c:if> name="isReturnCharge" value="1">是</label>
							<label><input type="radio" <c:if test="${model.isReturnCharge eq 2 }">checked="checked"</c:if> name="isReturnCharge" value="2">否</label>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">部分退款是否退回部分手续费：</label>
							<label><input type="radio" <c:if test="${model.isReturnCharge eq 1 }">checked="checked"</c:if> name="isReturnPartFee" value="1">是</label>
							<label><input type="radio" <c:if test="${model.isReturnCharge eq 2 }">checked="checked"</c:if> name="isReturnPartFee" value="2">否</label>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">退款到账时间：</label>
							<s:textfield name="refundAccountTime" value="%{model.refundAccountTime}" cssClass="required digits" minlength="1" maxlength="3" style="width: 50%" /><span class="info">单位：天</span>
						</div>
						<div class="unit">
						<label style="width: 20%;text-align: right;">退款限额：</label>
							<s:textfield name="refundLimit" value="%{model.refundLimit}" cssClass="required number" minlength="1" maxlength="10" style="width: 50%" /><span class="info">单位：元</span>
						</div>
						<%-- <div class="unit">
							<label style="width: 20%;text-align: right;">业务对账文件获取方式：</label>
							<select name="tradeGainCheckFileWay" class="combox">
								<option value="0">请选择</option>
								<option <c:if test="${model.tradeGainCheckFileWay eq 1 }">selected="selected"</c:if> value="1">接口</option>
								<option <c:if test="${model.tradeGainCheckFileWay eq 2 }">selected="selected"</c:if> value="2">FTP</option>
								<option <c:if test="${model.tradeGainCheckFileWay eq 3 }">selected="selected"</c:if> value="3">网银</option>
								<option <c:if test="${model.tradeGainCheckFileWay eq 4 }">selected="selected"</c:if> value="4">系统</option>
								<option <c:if test="${model.tradeGainCheckFileWay eq 5 }">selected="selected"</c:if> value="5">人工</option>
							</select>
						</div>
						<div class="unit">
							<label style="width: 20%;text-align: right;">业务对账文件获取时间：</label>
							<select name="tradeGainCheckFileTime" class="combox">
								<option value="0">请选择</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 1 }">selected="selected"</c:if> value="1">01:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 2 }">selected="selected"</c:if> value="2">02:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 3 }">selected="selected"</c:if> value="3">03:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 4 }">selected="selected"</c:if> value="4">04:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 5 }">selected="selected"</c:if> value="5">05:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 6 }">selected="selected"</c:if> value="6">06:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 7 }">selected="selected"</c:if> value="7">07:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 8 }">selected="selected"</c:if> value="8">08:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 9 }">selected="selected"</c:if> value="9">09:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 10 }">selected="selected"</c:if> value="10">10:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 11 }">selected="selected"</c:if> value="11">11:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 12 }">selected="selected"</c:if> value="12">12:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 13 }">selected="selected"</c:if> value="13">13:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 14 }">selected="selected"</c:if> value="14">14:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 15 }">selected="selected"</c:if> value="15">15:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 16 }">selected="selected"</c:if> value="16">16:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 17 }">selected="selected"</c:if> value="17">17:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 18 }">selected="selected"</c:if> value="18">18:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 19 }">selected="selected"</c:if> value="19">19:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 20 }">selected="selected"</c:if> value="20">20:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 21 }">selected="selected"</c:if> value="21">21:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 22 }">selected="selected"</c:if> value="22">22:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 23 }">selected="selected"</c:if> value="23">23:00</option>
								<option <c:if test="${model.tradeGainCheckFileTime eq 24 }">selected="selected"</c:if> value="24">24:00</option>
							</select>
						</div> --%>
						<div class="unit">
						<label style="width: 20%;text-align: right;">是否非工作日到账：</label>
							<label><input type="radio" <c:if test="${model.isNonWorkdayAccount eq 1 }">checked="checked"</c:if> name="isNonWorkdayAccount" value="1">是</label>
							<label><input type="radio" <c:if test="${model.isNonWorkdayAccount eq 2 }">checked="checked"</c:if> name="isNonWorkdayAccount" value="2">否</label>
						</div>
					<%-- 	<div class="unit">
							<label style="width: 20%;text-align: right;">清算对账文件获取方式：</label>
							<select name="fundGainCheckFileWay" class="combox">
								<option value="0">请选择</option>
								<option <c:if test="${model.fundGainCheckFileWay eq 1 }">selected="selected"</c:if> value="1">接口</option>
								<option <c:if test="${model.fundGainCheckFileWay eq 2 }">selected="selected"</c:if> value="2">FTP</option>
								<option <c:if test="${model.fundGainCheckFileWay eq 3 }">selected="selected"</c:if> value="3">网银</option>
								<option <c:if test="${model.fundGainCheckFileWay eq 4 }">selected="selected"</c:if> value="4">系统</option>
								<option <c:if test="${model.fundGainCheckFileWay eq 5 }">selected="selected"</c:if> value="5">人工</option>
							</select>
						</div>
						<div class="unit">
							<label style="width: 20%;text-align: right;">清算对账文件获取时间：</label>
							<select name="fundGainCheckFileTime" class="combox">
								<option value="0">请选择</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 1 }">selected="selected"</c:if> value="1">01:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 2 }">selected="selected"</c:if> value="2">02:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 3 }">selected="selected"</c:if> value="3">03:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 4 }">selected="selected"</c:if> value="4">04:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 5 }">selected="selected"</c:if> value="5">05:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 6 }">selected="selected"</c:if> value="6">06:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 7 }">selected="selected"</c:if> value="7">07:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 8 }">selected="selected"</c:if> value="8">08:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 9 }">selected="selected"</c:if> value="9">09:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 10 }">selected="selected"</c:if> value="10">10:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 11 }">selected="selected"</c:if> value="11">11:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 12 }">selected="selected"</c:if> value="12">12:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 13 }">selected="selected"</c:if> value="13">13:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 14 }">selected="selected"</c:if> value="14">14:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 15 }">selected="selected"</c:if> value="15">15:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 16 }">selected="selected"</c:if> value="16">16:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 17 }">selected="selected"</c:if> value="17">17:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 18 }">selected="selected"</c:if> value="18">18:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 19 }">selected="selected"</c:if> value="19">19:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 20 }">selected="selected"</c:if> value="20">20:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 21 }">selected="selected"</c:if> value="21">21:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 22 }">selected="selected"</c:if> value="22">22:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 23 }">selected="selected"</c:if> value="23">23:00</option>
								<option <c:if test="${model.fundGainCheckFileTime eq 24 }">selected="selected"</c:if> value="24">24:00</option>
							</select>
						</div> --%>
						<div class="unit">
							<label style="width: 20%;text-align: right;">备注：</label>
							<s:textarea name="comments" value="%{model.comments}"  maxlength="100" rows="3" cols="30"></s:textarea>
						</div>		 		
		</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="submitForm()">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
	function submitForm() {
		var id = $("#id").val();
		if (id.length > 0) {
			var url = "banksettlement_editBanksettlement.action";
			$("#form").attr("action", url);
		}

		$("#form").submit();
	}

</script>
