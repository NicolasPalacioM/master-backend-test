function calculateSineOfSum(num1, num2, scalingFactor = 1) {
  let sum = num1 + num2;
  let product = sum * scalingFactor;
  let sineValue = Math.sin(product);
  return sineValue;
}
