// Write a function, stepper(nums), that takes in an array of non negative numbers.
// Each element of the array represents the maximum number of steps you can take from that position in the array.
// The function should return a boolean indicating if it is possible to travel from the 
// first position of the array to the last position.
//
// For Example:
//
// Given [3, 1, 0, 5, 10]
//      - We begin at first position, 3. 
//      - Since the element is 3 we can take up to 3 steps from this position.
//      - This means we can step to the 1, 0, or 5
//      - Say we step to 1
//      - Since the element is 1, now the only option is to take 1 step to land on 0
//      - etc...
//
// Try to solve this in two ways, using tabulation and memoization.
//
// Examples:
//
// stepper([3, 1, 0, 5, 10]);           // => true, because we can step through elements 3 -> 5 -> 10
// stepper([3, 4, 1, 0, 10]);           // => true, because we can step through elements 3 -> 4 -> 10
// stepper([2, 3, 1, 1, 0, 4, 7, 8])    // => false, there is no way to step to the end
function stepper(nums) {
    // console.log(` the array is ${nums}`)
    // i = 0, nums[0] = 3
    const booleanArray = new Array(nums.length).fill(false);
    booleanArray[0] = true;

    for(let i = 0; i < nums.length; i++){
        if(booleanArray[i] === true){
            for (let j = 0; j <= nums[i]; j++){
                booleanArray[j] = true;
            }
        }

    }
    return booleanArray[booleanArray.length - 1];
}
        // // will be executed until counter = 3
        // // counter = 0
        // while (counter <= nums[i]){
        //     // counter = 1
        //     counter += 1;
        //     if (!nums[i + counter] && nums[i + counter] !== 0) break;
        //     stepsArray.push(nums[i + counter]);
        //     // console.log(stepsArray)
        // }
        // let oneIndex = stepsArray.indexOf(1)
        // // check if stepsArray only contains 1 and 0, then return false
        // // if (stepsArray[0] === 1 && stepsArray[1] === 0) return false;
        // if(stepsArray[oneIndex + 1] === 0 && stepsArray.every(ele => ele <= 1) ) return false;
        // // if index of 1 index++ === 0
        // for (let j = 0; j < stepsArray.length; j++){

        //     if (nums[i] + stepsArray[j] >= nums.length) {
        //         // console.log(`stepsarray: ${stepsArray} | ${stepsArray[j]}`);
        //         return true;
        //     }
        // }
    // }
    // return false;
// }
// console.log(stepper([3, 1, 0, 5, 10]))
// console.log(stepper([3, 4, 1, 0, 10]))
// console.log(stepper([2, 3, 1, 1, 0, 4, 7, 8])) 


// Write a function, maxNonAdjacentSum(nums), that takes in an array of nonnegative numbers.
// The function should return the maximum sum of elements in the array we can get if we cannot take
// adjacent elements into the sum.
//
// Try to solve this in two ways, using tabulation and memoization.
//
// Examples:
//
// maxNonAdjacentSum([2, 7, 9, 3, 4])  // => 15, because 2 + 9 + 4
                //   [2, 7, 11, 10, 15] 
// maxNonAdjacentSum([4,2,1,6])         // => 10, because 4 + 6 
function maxNonAdjacentSum(nums) {
    if (nums.length === 0) return 0;
    const array = new Array(nums.length).fill(0);
    array[0] = nums[0];
    for (let i = 1; i < nums.length ; i++){
        let leftNumber = array[i - 2] === undefined ? 0 : array[i - 2];
        let otherOption = array[i - 1] === undefined ? 0 : array[i - 1];
        let sum = nums[i] + leftNumber;
        array[i] = Math.max(sum, otherOption);
    }
    return array[array.length - 1];
}
console.log(maxNonAdjacentSum([2, 7, 9, 3, 4])) // => 10, because 4 + 6 

// Write a function, minChange(coins, amount), that accepts an array of coin values
// and a target amount as arguments. The method should the minimum number of coins needed
// to make the target amount. A coin value can be used multiple times.
//
// You've seen this problem before with memoization, but now solve it using the Tabulation strategy!
//
// Examples:
//
// minChange([1, 2, 5], 11)         // => 3, because 5 + 5 + 1 = 11
// minChange([1, 4, 5], 8))         // => 2, because 4 + 4 = 8
// minChange([1, 5, 10, 25], 15)    // => 2, because 10 + 5 = 15
// minChange([1, 5, 10, 25], 100)   // => 4, because 25 + 25 + 25 + 25 = 100
function minChange(coins, amount) {
    
}


module.exports = {
    stepper,
    maxNonAdjacentSum,
    minChange
};