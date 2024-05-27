function getOddNumbers(num) {
  const oddNumbers = [];

  for (let i = 1; i <= num; i++) {
    // Check if the current number is odd
    if (i % 2 !== 0) {
      oddNumbers.push(i);
    }
  }

  return oddNumbers;
}

// Example usage
console.log(getOddNumbers(9)); // Output: [1, 3, 5, 7, 9]
console.log(getOddNumbers(15)); // Output: [1, 3, 5, 7, 9, 11, 13, 15]
