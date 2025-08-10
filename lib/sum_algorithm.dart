List<(int, int, int)> threeSum(List<int> nums) {
  List<(int, int, int)> result = [];
  nums.sort();

  for (int i = 0; i < nums.length - 2; i++) {
    // Dublikatlarni oldini olish
    if (i > 0 && nums[i] == nums[i - 1]) continue;

    int left = i + 1;
    int right = nums.length - 1;

    while (left < right) {
      int sum = nums[i] + nums[left] + nums[right];

      if (sum == 0) {
        // Javobga qo‘shamiz Record formatida
        result.add((nums[i], nums[left], nums[right]));

        // Dublikatlarni o‘tkazib yuborish
        while (left < right && nums[left] == nums[left + 1]) {
          left++;
        }
        while (left < right && nums[right] == nums[right - 1]) {
          right--;
        }

        left++;
        right--;
      } else if (sum < 0) {
        left++;
      } else {
        right--;
      }
    }
  }

  return result;
}
