import { Component, signal } from '@angular/core';
import { ContadorComponent } from './components/contador/contador.component';
import { MostradorImagensComponent } from './components/mostrador-imagens/mostrador-imagens.component';
import { TodoComponent } from './components/todo/todo.component';

@Component({
  selector: 'app-root',
  imports: [ContadorComponent, MostradorImagensComponent, TodoComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'first-project';
}
