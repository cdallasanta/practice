// coord grid system
// start at 0,0
// print out steps to destination x,y

// straight after straight incurs cost
// 0,0 -> 0,1 = 1unit
// 0,1 -> 0,2 = 1 + .2 penalty

// function that calcs 0,0 -> x,y -> 0,0, returns units of time
// TODO: starting direction
const calculateUnits = (x, y) => {
  const absX = Math.abs(x);
  const absY = Math.abs(y);
  const smallerCoordinate = Math.min(absX, absY);
  const largerCoordinate = Math.max(absX, absY);
  const PENALTY = 0.2;
  let units = 0;

  // distance traveled diagonally = smallerCoordinate *2
  units += smallerCoordinate * 2;

  // add the remaining distance + remainder * penalty
  const difference = largerCoordinate - smallerCoordinate;
  let totalPenalty = difference * PENALTY;
  if (smallerCoordinate === 0){
    totalPenalty -= PENALTY;
  }
  units += difference + difference * totalPenalty;
  
  return units * 2;
}


// function returns the path there
// array of array coord pairs
// [[0,0], [0,1]] etc

const findThePath = (x,y) => {
  const absX = Math.abs(x);
  const absY = Math.abs(y);
  let xDirection = x > 0 ? 1 : -1;
  let yDirection = y > 0 ? 1 : -1;

  let currentPosition = [0,0];
  const path = [currentPosition];

  const updateX = () => {
    if (currentPosition[0] !== x){
      currentPosition[0] += xDirection;
      path.push(currentPosition);
    }
  }
  
  const updateY = () => {
    if (currentPosition[1] !== y){
      currentPosition[1] += yDirection;
      path.push(currentPosition);
    }
  }

  let function1 = absX > absY ? updateX : updateY;
  let function2 = absX > absY ? updateY : updateX;

  while (currentPosition[0] !== x || currentPosition[1] !== y){
    function1();
    function2();
  }

  return path;
}

console.log(findThePath(5,-7));