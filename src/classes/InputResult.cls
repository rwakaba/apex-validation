/**
 * represent one validation result class.
 */
public virtual class InputResult {
    public virtual Boolean valid() { return false; }
    public virtual Boolean inValid() { return !valid(); }
    public virtual String getValidContent() { return null; }

    public virtual Boolean notInput() { return false; }
    public virtual Boolean tooLong() { return false; }
    public virtual Boolean badPattern() { return false; }
    public virtual Boolean bigValue() { return false; }
    public virtual Boolean smallValue() { return false; }


    public class Valid extends InputResult {
        public override Boolean valid() { return true;}
    }

    public class InValid extends InputResult {
    }

    public class NotInput extends InputResult {
        public Integer value { get; private set; }
        public override Boolean notInput() { return true; }
    }

    public class TooLong extends InputResult {
        public Integer value { get; private set; }
        public TooLong(Integer value) {
            this.value = value;
        }
        public override String getValidContent() {
            return String.valueOf(value);
        }
        public override Boolean tooLong() { return true; }
    }

    public class BadPattern extends InputResult {
        public String pattern { get; private set; }
        public BadPattern(String pattern) {
            this.pattern = pattern;
        }
        public override String getValidContent() {
            return pattern;
        }
        public override Boolean badPattern() { return true; }
    }

    public class BigValue extends InputResult {
        public Integer value { get; private set; }
        public BigValue(Integer value) {
            this.value = value;
        }
        public override String getValidContent() {
            return String.valueOf(value);
        }
        public override Boolean bigValue() { return true; }
    }

    public class SmallValue extends InputResult {
        public Integer value { get; private set; }
        public SmallValue(Integer value) {
            this.value = value;
        }
        public override String getValidContent() {
            return String.valueOf(value);
        }
        public override Boolean smallValue() { return true; }
    }
}
