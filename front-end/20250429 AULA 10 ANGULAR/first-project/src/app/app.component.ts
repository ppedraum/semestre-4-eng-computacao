import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'first-project';
  contador = signal(0);
  imgIndex = signal(0);
  listaImgs = signal(['gato_1.jpg', 'gato_2.jpg', 'gato_3.jpg']);

  incrementar() {
    this.contador.update((v) => ++v);
  }

  decrementar() {
    let valorAtual = this.contador();
    this.contador.set(--valorAtual);
  }

  proximo() {
    this.imgIndex.update((v) => ++v);
    if (this.imgIndex() > this.listaImgs().length - 1)
      this.imgIndex.update((v) => (v = 0));
  }
  anterior() {
    this.imgIndex.update((v) => --v);
    if (this.imgIndex() < 0)
      this.imgIndex.update((v) => (v = this.listaImgs().length - 1));
  }
}
