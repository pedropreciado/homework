import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      result: 0,
      num1: "",
      num2: ""
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  render () {
    return (
      <div>
        <h1>{this.state.result}</h1>

      <input onChange={this.setNum1} value={this.state.num1}/>
      <input onChange={this.setNum2} value={this.state.num2}/>
      <button onClick={this.add}>+</button>
      <button onClick={this.subtract}>-</button>
      <button onClick={this.multiply}>*</button>
      <button onClick={this.divide}>/</button>
      <br />
      <button onClick={this.clear}>Clear!</button>
    </div>
    )
  };

  setNum1 (event) {
    
    let num1;
    if (event.target.value) {
      num1 =  parseInt(event.target.value);
      } else {
      num1 = "";
    }
    this.setState({num1});
  }

  setNum2 (event) {
    let num2;
    if (event.target.value) {
      num2 = parseInt(event.target.value);
    } else {
      num2 = "";
    }
    this.setState({num2});
  }

  add (event) {
    event.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({result})
  }

  subtract (event) {
    event.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  divide (event) {
    event.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  multiply (event) {
    event.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  clear (event) {
    event.preventDefault();
    let num1 = "";
    let num2 = "";
    this.setState({num1, num2});
  }

}

export default Calculator;
