<apex:component controller="MessageController" >
    <apex:attribute name="validationResults" type="ValidationResults" required="true" description="" assignTo="{!results}"/>
    <apex:attribute name="itemName" type="String" required="true" description="" assignTo="{!key}"/>
    <apex:attribute name="label" type="String" required="true" description=""/>
    <apex:outputPanel rendered="{!isRequired}" layout="none">
                <p class="error-msg"><i class="icon icon-error"></i>{!label}は必須入力です</p>
    </apex:outputPanel>

    <apex:outputPanel rendered="{!isMaxLength}" layout="none">
                <p class="error-msg"><i class="icon icon-error"></i>{!label}は{!result.validContent}文字以下です</p>
    </apex:outputPanel>

</apex:component>
