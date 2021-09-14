"use strict";

const fs = require("fs");

process.stdin.resume();
process.stdin.setEncoding("utf-8");

let inputString = "";
let currentLine = 0;

process.stdin.on("data", function (inputStdin) {
  inputString += inputStdin;
});

process.stdin.on("end", function () {
  inputString = inputString.split("\n");

  main();
});

function readLine() {
  return inputString[currentLine++];
}

// Solution
// Brute force: Find the abs difference between each combination of nums in arr, then returning the smallest result => O(n^2)
// The numbers that are closest to eachother will have the smallest absolute difference
// Therefore, if we sort first, then calculate the difference between adjacent nums in the sorted arr, we can find the min abs difference => O(nlgn)

function minimumAbsoluteDifference(arr) {
  arr.sort((a, b) => a - b);
  let min = Math.abs(arr[1] - arr[0]);
  for (let i = 1; i < arr.length - 1; i++) {
    min = Math.min(Math.abs(arr[i + 1] - arr[i]), min);
  }
  return min;
}

function main() {
  const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

  const n = parseInt(readLine().trim(), 10);

  const arr = readLine()
    .replace(/\s+$/g, "")
    .split(" ")
    .map((arrTemp) => parseInt(arrTemp, 10));

  const result = minimumAbsoluteDifference(arr);

  ws.write(result + "\n");

  ws.end();
}
