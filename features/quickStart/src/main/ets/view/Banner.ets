import { BannerClass } from '../model/BannerClass';
import { bufferToString } from '../utils/bufferUtil';

@Component
export struct Banner {
  @Consume('articlePathStack') articlePathStack: NavPathStack;
  @State bannerList: Array<BannerClass> = []

  aboutToAppear(): void {
    this.getDataFromJSON();
  }

  getDataFromJSON() {
    getContext(this).resourceManager.getRawFileContent('BannerData.json')
      .then(value=>{
        this.bannerList = JSON.parse(bufferToString(value.buffer)) as BannerClass[]
      })
  }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image($r(item.imageSrc))
          .width('100%')
          .padding({ top: 11, left: 10, right: 16 })
          .borderRadius(16)
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            this.articlePathStack.pushPathByName('bannerDetailPage', item)
          })
      }, (item: BannerClass) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a0000')
        .selectedColor('#0A59F7')
    )
  }
}