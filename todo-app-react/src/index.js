import React from 'react';
import ReactDOM from 'react-dom';
import {ToDo} from './components/Todo';
import registerServiceWorker from './registerServiceWorker';

var taskList = [];

var tasks = localStorage.getItem('storedTasks');

if(tasks){
    taskList = JSON.parse(tasks);
}

ReactDOM.render(
    <ToDo tasks={taskList} />, 
    document.getElementById('root'));
registerServiceWorker();
