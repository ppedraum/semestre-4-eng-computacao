import { Component, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-todo',
  imports: [FormsModule],
  templateUrl: './todo.component.html',
  styleUrl: './todo.component.css',
})
export class TodoComponent {
  currentTask = signal('');
  taskList = signal<string[]>([]);

  enviar() {
    const task = this.currentTask();
    if (!task.trim()) return;
    this.taskList.update((v) => [task, ...v]); // v.push(task)
    this.currentTask.update((v) => (v = ''));
  }

  removeTask(task: string) {}
}
