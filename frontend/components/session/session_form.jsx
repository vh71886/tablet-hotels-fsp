import React from "react";
import { Link } from 'react-router-dom';

export default class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            fname: "",
            lname: "",
            email: "",
            password: "",
        };
    }

    handleInput = type => {
        return e => {
            this.setState({ [type]: e.target.value });
        }
    }

    handleSubmit = e => {
        e.preventDefault();
        const user = Object.assign( {}, this.state );
        this.props.processForm(user); 
    }

    render() {
        const otherFormType = (this.props.formType === "Sign In") ? ("Register") : ("Sign In");
        const otherFormLink = (this.props.formType === "Sign In") ? ("register") : ("signin");
        
        const name = (
            <>
                <br></br>
                <label className="fname-label">First Name:
                    <input 
                        className="fname-input"
                        type="text"
                        value={this.state.fname}
                        onChange={this.handleInput("fname")}
                    />
                </label>
                <br></br>

                <label className="lname-label">Last Name:
                    <input
                        className="lname-input" 
                        type="text"
                        value={this.state.lname}
                        onChange={this.handleInput("lname")}
                    />
                </label>
            </>
        )   

        return (
            <div className="session-form-container">
                <h1 className="session-form-header">{this.props.formType}</h1>
                <Link to={`/${otherFormLink}`}>{`or Click to ${otherFormType}`}</Link>
                <br></br><br></br>

                <form className="session-form">
                    <label className="email-label">Email:
                        <input
                            className="email-input"
                            type="text"
                            value={this.state.email}
                            onChange={this.handleInput("email")}
                        />
                    </label>

                    { (this.props.formType === "Register") && name }

                    <br></br>
                    <label className="password-label">Password:
                        <input 
                            className="password-input"
                            type="password"
                            value={this.state.password}
                            onChange={this.handleInput("password")}
                        />
                    </label>
                    <br></br>
                    <button 
                        className="session-form-button"
                        onClick={this.handleSubmit}>
                            {this.props.formType}
                    </button>
                </form>
            </div>
        )
    }
}