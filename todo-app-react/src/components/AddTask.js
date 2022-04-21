import React from 'react';

export class AddNewTask extends React.Component{
    constructor(){
        super();
        this.justSubmitted = this.justSubmitted.bind(this);
    }

    justSubmitted(event){
        event.preventDefault();

        var input = event.target.querySelector('input');
        var value = input.value;
        input.value = '';

        this.props.updateList(value);

    }

    render(){
        return(
            <form onSubmit={this.justSubmitted}>
                <div className="input-group mb-3">
                    <input type="text" className="form-control" placeholder="Type item and press Enter" aria-label="item" aria-describedby="basic-addon1" />
                    
                    <div className="input-group-append">
                        <span className="input-group-text" id="basic-addon1"><i className="fas fa-plus"></i></span>
                    </div>
                </div>
            </form>
        );
    }

}