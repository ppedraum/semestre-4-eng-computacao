//web server express
const express = require('express');
//onde vai ficar guardado as rotas
const app = express();
//responsável por criar o servidor http
const http = require('http');
//cria servidor com o app como parametro
const server = http.createServer(app);
//app de sockets com o socket.io
const { Server } = require('socket.io');
const io = new Server(server);

//rota principal (raíz) retorna a página html
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

//Ao conectar-se, cria um novo socket (uma nova conexão)
io.on('connection', (socket) => {
    console.log('User connected');
    //ao desconectar
    socket.on('disconnect', () => {
        console.log('User disconnected');
    });

    //Ao enviar uma mensagem
    socket.on('chat message', (msg) => {
        console.log(msg);
        //Realiza broadcast (manda pra todos os clients menos o que enviou o evento)
        socket.broadcast.emit('chat message', msg);
    });

    //Ao entrar um novo usuário
    socket.on('user joined', (user) => {
        //emite um evento de usuário entrou
        io.emit('user joined', user);
    });

    //Ao usuário digitar algo
    socket.on('user typing', (user) => {
        //emite um evento
        socket.broadcast.emit('user typing', user);
    });

    //Ao usuário parar de digitar algo
    socket.on('user stopped typing', (user) => {
        //emite um evento
        socket.broadcast.emit('user stopped typing', user);
    });
});

//servidor escutando na porta 3000
server.listen(3000, () => {
    //Mensagem padrão
    console.log('listening on *:3000');
});
