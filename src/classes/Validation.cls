public class Validation {

    /**
     * check the value to be input
     * @param value [Object] input value
     */
    public static InputResult checkRequired(Object value) {
        Boolean input = false;
        if (value != null) {
            if (value instanceof String) {
                input = String.isEmpty((String) value);
            } else {
                input = true;
            }
        }
        if (input) {
            return new InputResult.Valid();
        } else {
            return new InputResult.NotInput();
        }
    }

    /**
     * check the value to be not over length
     * @param value [String] input value
     */
    public static InputResult checkLength(String value, Integer max) {
        if (value != null && value.length() > max) {
            return new InputResult.TooLong(max);
        }
        return new InputResult.Valid();
    }

    /**
     * check the value to be match the pattern
     * @param value [String] input value
     */
    public static InputResult checkPattern(String value, String regex, String label) {
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(value);

        if (!m.matches()) {
            return new InputResult.BadPattern(label);
        }
        return new InputResult.Valid();
    }

    /**
     * check the value to be not over max value
     * @param value [String] input value
     */
    public static InputResult checkMax(String value, Integer max) {
        try {
            Integer i = Integer.valueOf(value);
            if (i > max) {
                return new InputResult.BigValue(max);
            }
            return new InputResult.Valid();
        } catch (TypeException e) {
            return new InputResult.InValid();
        }
    }

    /**
     * check the value to be not over min value
     * @param value [String] input value
     */
    public static InputResult checkMin(String value, Integer min) {
        try {
            Integer i = Integer.valueOf(value);
            if (i < min) {
                return new InputResult.SmallValue(min);
            }
            return new InputResult.Valid();
        } catch (TypeException e) {
            return new InputResult.InValid();
        }
    }

    /**
     * check the value to be match the pattern
     * @param value [String] input value
     */
    public static InputResult checkMail(String value, MailFormat format, String label) {
        if (format.isValid(value)) {
            return new InputResult.InvalidMail();
        }
        return new InputResult.Valid();
    }

    /**
     * Mail format interface.
     */
    public interface MailFormat {
        Boolean isValid(String value);
    }
}

