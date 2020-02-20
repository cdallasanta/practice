// integrating with external API, owned within company, no documentation
// simple function to call api, return single value
// getMetric()
// call getMetric(), then display it to user
// updates once per minute
// poller() calls myFunction() every second, which will need to call getMetric() at a different frequency

const state = {
  time1: 0,
  time2: 30,
  updateTime: null,
  data: null,
  confidence : 29
}

const getData = seconds => {
  const newData = getMetric();
  if (newData !== this.state.data) {
    setData(newData);

  } else {

  }
}

const setData = (data, seconds) => {
  this.setState({
    data: data
  })
}

const myFunction = seconds =>{
  if (seconds == this.state.updateTime) {
    getData();
  } else if (seconds === this.state.time1 || seconds === this.state.time2){
    getData(seconds);
  }
  

  return {
    data: this.state.data,
    confindence: this.state.confidence
  }
}


// receive sorted array of numbers
const include = numbers => {
  let midpoint = Math.floor(numbers.length / 2);

  // if x is out of bounds, return false
  if (x < numbers[0] || x > numbers[numbers.length-1]){
    return false;
  }

  if (numbers[midpoint] === x) {
    return true;
  } else if (numbers.length === 1){
    return false;
  }

  if (numbers[midpoint] > x){
    return include(numbers.slice(0, midpoint));
  } else {
    return include(numbers.slice(midpoint + 1, numbers.length));
  }
}

const arr = [1,3,15,22,47,58];
const x = 58;

console.log(include(arr));