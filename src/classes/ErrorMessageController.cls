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
        return getResult(new NotInputSpecifer());
    }}
    public InputResult resultBadPattern { get {
        return getResult(new BadPatternSpecifer());
    }}
    public InputResult resultTooLong { get {
        return getResult(new TooLongSpecifer());
    }}
    public InputResult resultBigValue { get {
        return getResult(new BigValueSpecifer());
    }}
    public InputResult resultSmallValue { get {
        return getResult(new SmallValueSpecifer());
    }}
    public InputResult resultCustomRuleError { get {
        return getResult(new CustomRuleErrorSpecifer());
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
    private InputResult getResult(Specifier s) {
        if (results != null) {
            for (InputResult r : results.getResults(key)) {
                if (s.isInstance(r)) {
                    return r;
                }
            }
        }
        return null;
    }

    // ---------------------- helper ----------------------------
    private interface Specifier {
        Boolean isInstance(InputResult result);
    }

    private class NotInputSpecifer implements Specifier {
        public Boolean isInstance(InputResult result) {
            return result instanceof InputResult.NotInput;
        }
    }
    private class BadPatternSpecifer implements Specifier {
        public Boolean isInstance(InputResult result) {
            return result instanceof InputResult.BadPattern;
        }
    }
    private class TooLongSpecifer implements Specifier {
        public Boolean isInstance(InputResult result) {
            return result instanceof InputResult.TooLong;
        }
    }
    private class BigValueSpecifer implements Specifier {
        public Boolean isInstance(InputResult result) {
            return result instanceof InputResult.BigValue;
        }
    }
    private class SmallValueSpecifer implements Specifier {
        public Boolean isInstance(InputResult result) {
            return result instanceof InputResult.SmallValue;
        }
    }
    private class CustomRuleErrorSpecifer implements Specifier {
        public Boolean isInstance(InputResult result) {
            return result instanceof InputResult.CustomRuleError;
        }
    }
}
