export class BannerClass {
  id: string = '';
  imgSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imgSrc: ResourceStr, url: string) {
    this.id = id;
    this.imgSrc = imgSrc;
    this.url = url;
  }
}