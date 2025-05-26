import { Component, signal } from '@angular/core';

@Component({
  selector: 'app-contador',
  imports: [],
  templateUrl: './contador.component.html',
  styleUrl: './contador.component.css',
})
export class ContadorComponent {
  contador = signal(0);

  incrementar() {
    this.contador.update((v) => ++v);
  }

  decrementar() {
    let valorAtual = this.contador();
    this.contador.set(--valorAtual);
  }
}
