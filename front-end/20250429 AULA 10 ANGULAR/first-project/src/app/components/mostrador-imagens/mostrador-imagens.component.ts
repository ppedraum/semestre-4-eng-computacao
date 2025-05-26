import { Component, signal } from '@angular/core';

@Component({
  selector: 'app-mostrador-imagens',
  imports: [],
  templateUrl: './mostrador-imagens.component.html',
  styleUrl: './mostrador-imagens.component.css',
})
export class MostradorImagensComponent {
  imgIndex = signal(0);
  listaImgs = signal(['gato_1.jpg', 'gato_2.jpg', 'gato_3.jpg']);

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
