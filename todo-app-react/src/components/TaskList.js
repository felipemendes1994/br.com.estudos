import React from 'react';

export class ToDoAppList extends React.Component{
    constructor(){
        super();
        this.removeItem = this.removeItem.bind(this);
    }

    removeItem(elem){
        //var value = elem.target.parentNode.querySelector('span').innerText;
        let value = elem.target.innerText
        this.props.removeItem(value);
    }

    render(){

        var itens = this.props.tasks.map((elem, i) => {
            return (
                <li className="list-group-item list-group-item-action" onClick={this.removeItem} value={elem} key={i}>
                    {elem}
                </li>
            );
        });

        return(
            <ul className="list-group">
                {itens}
            </ul>
        );
    }

}