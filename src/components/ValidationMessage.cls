<apex:component controller="ErrorMessageController" >

    <apex:attribute name="validationResults" type="ValidationResults" required="true" description="" assignTo="{!results}"/>

    <apex:attribute name="itemName" type="String" required="true" description="" assignTo="{!key}"/>

    <apex:attribute name="label" type="String" required="true" description=""/>

	<!-- 必須エラー -->
    <apex:outputPanel rendered="{!showNotInputError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!label}は必須入力です</p>
    </apex:outputPanel>

	<!-- 形式エラー -->
    <apex:outputPanel rendered="{!showBadPatternError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!label}は{!resultBadPattern.validContent}で入力してください</p>
    </apex:outputPanel>

	<!-- 文字数エラー -->
    <apex:outputPanel rendered="{!showTooLongError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!label}は{!resultTooLong.validContent}文字以下で入力してください</p>
    </apex:outputPanel>

	<!-- 最大数数エラー -->
    <apex:outputPanel rendered="{!showBigError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!label}は{!resultBigValue.validContent}以下で入力してください</p>
    </apex:outputPanel>

	<!-- 最小数数エラー -->
    <apex:outputPanel rendered="{!showSmallError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!label}は{!resultSmallValue.validContent}以上で入力してください</p>
    </apex:outputPanel>

</apex:component>
