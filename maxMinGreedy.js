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

// solution
// could brute force by finding the max-min for each combination of k elements, then return the min
// if we sort, we know nums next to eachother will be closest in value
// then, we can just find the value of the arr at i = 0 and k - 1 (the kth element)
// since we know the values are sorted, we know max is arr[k-1] and min is arr[i], so just subtract
// can store those values and return their min once all max-mins are found
function maxMin(k, arr) {
  arr.sort((a, b) => a - b);

  const res = [];
  let i = 0;

  while (k <= arr.length) {
    res.push(arr[k - 1] - arr[i]); // max - min
    i++, k++;
  }

  return Math.min(...res);
}

function main() {
  const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

  const n = parseInt(readLine().trim(), 10);

  const k = parseInt(readLine().trim(), 10);

  let arr = [];

  for (let i = 0; i < n; i++) {
    const arrItem = parseInt(readLine().trim(), 10);
    arr.push(arrItem);
  }

  const result = maxMin(k, arr);

  ws.write(result + "\n");

  ws.end();
}
