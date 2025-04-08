const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require('socket.io');
const io = new Server(server);

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

io.on('connection', (socket) => {
    console.log('User connected');
    socket.on('disconnect', () => {
        console.log('User disconnected');
    });

    socket.on('chat message', (msg) => {
        console.log(msg);
        socket.broadcast.emit('chat message', msg);
    });

    socket.on('user joined', (user) => {
        io.emit('user joined', user);
    });

    socket.on('user typing', (user) => {
        socket.broadcast.emit('user typing', user);
    });

    socket.on('user stopped typing', (user) => {
        socket.broadcast.emit('user stopped typing', user);
    });
});

server.listen(3000, () => {
    console.log('listening on *:3000');
});
