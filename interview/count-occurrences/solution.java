/*
 * Problem: Count occurrences of a specified target in a sorted list.
 *
 * n = length of the input list
 * m = number of occurrences
 * naive solution: O(n)
 * binary search solution: O(log n)
 */

int countOccurences(int needle, int[] haystack) {
  if (haystack.lengh == 0) {
    return 0;
  }
  int firstOccurrence = findFirstOccurence(needle, hastack);
  if (firstOccurrence == -1) {
    return 0;
  }
  int lastOccurrence = findLastOccurence(needle, haystack);
  return lastOccurrence - firstOccurrence + 1;
}

int findFirstOccurrence(int needle, int[] haystack) {
  if (haystack[0] == needle) {
    return 0;
  }
  int rangeStart = 0;
  int position = haystack.length / 2;
  int rangeEnd = haystack.length - 1;

  while (true) {
    if (haystack[position] < needle) {
      rangeStart = position;
      position = (rangeStart + rangeEnd)/2;
    } else if (needle < haystack[position] || (needle == haystack[position] && needle == haystack[position-1])) {
      rangeEnd = position;
      position = (rangeStart + rangeEnd)/2;
    } else {
      return position;
    }
    if (rangeStart == rangeEnd) {
      if (needle != haystack[position]) {
        return -1;
      } else {
        return position; // probably unreachable
      }
    }
  }
  return -1;
}

/*
 * Things to test:
 * - null input
 * - empty input
 * - singleton list input
 *   - with needle
 *   - without needle
 * - longer list
 *   - no needle
 *   - all needle
 *   - needle at beginning
 *     - occurs once
 *     - occurs more than once
 *   - needle at end
 *     - occurs once
 *     - occurs more than once
 *   - needle in the middle
 *     - occurs once
 *     - occurs more than once
 */
