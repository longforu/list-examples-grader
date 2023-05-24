import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
  @Test
  public void testFilter1() {
    List<String> input1 = Arrays.asList("a", "b", "c");
    List<String> result = ListExamples.filter(input1, new StringChecker() {
      public boolean checkString(String s) {
        return true;
      }
    });
    assertEquals(input1, result);
  }

  // test that the function is not in an infinite loop
  @Test (timeout=1000)
  public void testMerge1() {
    List<String> input1 = Arrays.asList("a", "b", "c");
    List<String> input2 = Arrays.asList("d");
    List<String> result = ListExamples.merge(input1, input2);
    assertEquals(4, result.size());
  }
}
