import React from 'react';

import {AddNewTask} from './AddTask';
import {ToDoAppList} from './TaskList';

export class ToDo extends React.Component{
    constructor(props){
        super();
        this.state = {
            tasks: props.tasks
        }

        this.updateList = this.updateList.bind(this);
        this.removeTask = this.removeTask.bind(this);
    }

    updateList(text){
        var updatedTask = this.state.tasks;
        updatedTask.unshift(text);
        this.setState({tasks: updatedTask});
        this.updateLocalStorage(updatedTask);
    }

    removeTask(text){
        var updatedTask = this.state.tasks;
        updatedTask.splice(updatedTask.indexOf(text), 1);
        this.setState({tasks: updatedTask});
        this.updateLocalStorage(updatedTask);
    }
    
    updateLocalStorage(updatedTask){
        localStorage.setItem('storedTasks', JSON.stringify(updatedTask));
    }

    render(){
        return(
            <div>
                <div className="p-3 mb-2 bg-dark text-white">
                        <center>
                            <h1 className="display-4">To Do List</h1>  
                        </center>
                        
                        <div className="container">
                            <AddNewTask updateList={this.updateList} />
                        </div>

                        <br />
                        <center><small><em><span>Click on the Item to remove it from the list</span></em></small></center>

                </div>
                <div className="container">
                    <ToDoAppList tasks={this.state.tasks} removeItem={this.removeTask}/> 
                </div>
                <div className="fixed-bottom">
                        <center><small><em><span>Powered by Felipe Mendes</span></em></small></center>
                    <br />
                </div>
            </div>
        );
    }
}