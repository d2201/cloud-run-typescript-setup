import express from 'express'

const app = express()
const PORT = process.env.PORT || 3000

app.get('*', (req, res) => {
  console.log('Got request at', req.path)
  res.send(`Hello world from -> ${req.path}`)
})

app.listen(PORT, () => {
  console.log('Listening on port:', PORT)
})
