{sum} = require 'prelude-ls'

$ \.text .hover (-> $ this .css \color \red), (-> $ this .css \color \black)

new Vue {
    el: '#app',
    data: {
        message: 'My boilerplate !'
    }
}

new Vue {
    el: '#app2',
    data: {
        todos: [
            { text: 'Learn JS'},
            { text: 'Okay'},
            { text: 'Nice !'}
        ]
    }
}


new Vue {
  el: '#app3',
  data: {
    message: 'Hello Vue.js!'
  },
  methods: {
    reverseMessage: ->
      this.message = this .message .split '' .reverse! .join ''
  }
}


new Vue {
  el: '#app4',
  data: {
    newTodo: '',
    todos: [
      { text: 'Add some todos' }
    ]
  },
  methods: {
    addTodo: ->
      text = this .newTodo .trim!
      if text
        this.todos.push { text: text }
        this.newTodo = ''
    ,
    removeTodo: (index) ->
      this.todos.splice index, 1
  }
}

MyComponent = Vue.extend {
  template: '<div>A custom component!</div>'
}
# register
Vue.component 'my-component', MyComponent
# create a root instance
new Vue {
  el: '#app5'
}
