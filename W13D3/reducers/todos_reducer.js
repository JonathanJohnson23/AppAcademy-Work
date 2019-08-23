import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: 'wash cat',
        body: 'with oil',
        done: false
    },
    2: {
        id: 2,
        title: 'plot revenge',
        body: 'they killed my father, prepare to die',
        done: true
    }
}


const todosReducer = (state = initialState, action) => {
   
   const copy = state;
   switch(action.type) {
      case RECEIVE_TODOS:
          copy.todos = action.todos;
          return copy;
      case RECEIVE_TODO:
         return action.todo
      default: 
         return state;
   }
};

export default todosReducer;