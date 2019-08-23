import React from 'react';


class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
      return (
         <li className="todo-list-item">
            <div className="todo-header">
               {this.props.todo.title}
            </div>
         </li>
      )

    }
}

export default TodoListItem;