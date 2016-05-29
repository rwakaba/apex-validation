/**
 * represent one validation result class.
 */
public virtual class InputResult {
    public virtual String getValidContent() { return null; }
    public virtual String getMessage() { return null; }

    public class Valid extends InputResult {
    }

    public class InValid extends InputResult {
    }

    public class NotInput extends InputResult {
    }

    public class TooLong extends InputResult {
        public Integer value { get; private set; }
        public TooLong(Integer value) {
            this.value = value;
        }
        public override String getValidContent() {
            return String.valueOf(value);
        }
    }

    public class BadPattern extends InputResult {
        public String pattern { get; private set; }
        public BadPattern(String pattern) {
            this.pattern = pattern;
        }
        public override String getValidContent() {
            return pattern;
        }
    }

    public class BigValue extends InputResult {
        public Integer value { get; private set; }
        public BigValue(Integer value) {
            this.value = value;
        }
        public override String getValidContent() {
            return String.valueOf(value);
        }
    }

    public class SmallValue extends InputResult {
        public Integer value { get; private set; }
        public SmallValue(Integer value) {
            this.value = value;
        }
        public override String getValidContent() {
            return String.valueOf(value);
        }
    }

    public class CustomRuleError extends InputResult {
        private String message;
        public CustomRuleError(String message) {
            this.message = message;
        }
        public override String getMessage() {
            return message;
        }
    }
}
