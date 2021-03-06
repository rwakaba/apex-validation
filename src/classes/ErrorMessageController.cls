/**
 * Use with ErrorMessageComponent Controller.
 */
public class ErrorMessageController {

    // ------------- Component Attributes property. -----------------
    public ValidationResults results { get; set; }

    public String key { get; set; }

    public String displayName { get; set; }

    // ------------- helper property. -----------------
    public InputResult resultNotInput { get {
        return getResult(InputResult.Type.NotInput);
    }}
    public InputResult resultBadPattern { get {
        return getResult(InputResult.Type.BadPattern);
    }}
    public InputResult resultTooLong { get {
        return getResult(InputResult.Type.TooLong);
    }}
    public InputResult resultBigValue { get {
        return getResult(InputResult.Type.BigValue);
    }}
    public InputResult resultSmallValue { get {
        return getResult(InputResult.Type.SmallValue);
    }}
    public InputResult resultCustomRuleError { get {
        return getResult(InputResult.Type.CustomRuleError);
    }}

    // ------------- For rendered property. -----------------
    public Boolean showNotInputError {
        get { return resultNotInput != null; }
    }

    public Boolean showBadPatternError {
        get { return resultBadPattern != null; }
    }
    public Boolean showTooLongError {
        get { return resultTooLong != null; }
    }
    public Boolean showBigError {
        get { return resultBigValue != null; }
    }
    public Boolean showSmallError {
        get { return resultSmallValue != null; }
    }
    public Boolean showCustomRule {
        get { return resultCustomRuleError != null; }
    }

    public String messageNotInput { get {
        return String.format(System.Label.MSG_NOT_INPUT_TEMPLATE, new String[]{ displayName });
    }}
    public String messageBadPattern { get {
        String[] filter = new String[]{ displayName, resultBadPattern.getValidContent() };
        return String.format(System.Label.MSG_BAD_PATTERN_TEMPLATE, filter); 
    }}
    public String messageTooLong { get {
        String[] filter = new String[]{ displayName, resultTooLong.getValidContent() };
        return String.format(System.Label.MSG_TOO_LONG_TEMPLATE, filter); 
    }}
    public String messageBigValue { get {
        String[] filter = new String[]{ displayName, resultBigValue.getValidContent() };
        return String.format(System.Label.MSG_BIG_VALUE_TEMPLATE, filter); 
    }}
    public String messageSmallValue { get {
        String[] filter = new String[]{ displayName, resultSmallValue.getValidContent() };
        return String.format(System.Label.MSG_SMALL_VALUE_TEMPLATE, filter); 
    }}
    
    // ---------------------- private ----------------------------
    private InputResult getResult(InputResult.Type type) {
        if (results != null) {
            for (InputResult r : results.getResults(key)) {
                if (type == r.getType()) {
                    return r;
                }
            }
        }
        return null;
    }
}
