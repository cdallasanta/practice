const express = require('express');
const Joi = require('joi');

const app = express();
app.use(express.json());


const courses = [
  {
    id: 1,
    name: "course 1"
  },
  {
    id: 2,
    name: "course 2"
  },
  {
    id: 3,
    name: "course 3"
  },
]

app.get('/', (req, resp) => {
  resp.send('Hello World');
});

app.get('/api/courses', (req, resp) => {
  resp.send(courses);
});

app.get('/api/courses/:id', (req, resp) => {
  const course = courses.find(c => c.id == req.params.id);
  if (!course) {
    resp.status(404).send("Not found");
  } else {
    resp.send(course);
  }
});

app.post('/api/courses', (req, resp) => {
  // validate
  const {error} = validateCourse(req.body)
  if (error) {
    resp.status(400).send(error.details[0].message);
    return;
  }

  const course = {
    id: courses.length + 1,
    name: req.body.name
  };
  courses.push(course);

  resp.send(course);
});

app.put('/api/courses/:id', (req, resp) => {
  const course = courses.find(c => c.id == req.params.id)
  if (!course){
    resp.status(404).send("Not found");
    return;
  }

  // validate
  const {error} = validateCourse(req.body)
  if (error) {
    resp.status(400).send(error.details[0].message);
    return;
  }

  // update and return
  course.name = req.body.name;

  resp.send(course);
})

function validateCourse(course) {
  const schema = {
    name: Joi.string().min(3).required()
  }
  return Joi.validate(course, schema);
}

const port = process.env.PORT || 3000
app.listen(port, () => console.log(`Listening on port ${port}...`));