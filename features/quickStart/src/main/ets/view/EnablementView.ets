import { ArticleClass } from '../model/ArticleClass';
import { bufferToString } from '../utils/bufferUtil';

@Component
export struct EnablementView {
  @Consume('articlePathStack') articlePathStack: NavPathStack;
  @State enablementList: Array<ArticleClass> = [];

  aboutToAppear(): void {
    this.getDataFromJSON();
  }

  getDataFromJSON() {
    getContext(this).resourceManager.getRawFileContent('EnablementData.json')
      .then(value=>{
        this.enablementList = JSON.parse(bufferToString(value.buffer)) as ArticleClass[]
      })
  }

  build() {
    Column() {
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 });
      Grid() {
        ForEach(this.enablementList, (item: ArticleClass) => {
          GridItem() {
            EnablementItem({ enablementItem: item })
              .onClick(() => {
                this.articlePathStack.pushPathByName('articleDetail', item)
              })
          }
        })
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top: 2, left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}


@Component
struct EnablementItem {
  @Prop enablementItem: ArticleClass;

  build() {
    Column() {
      Image($r('app.media.enablement_pic1'))
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })
      Text(this.enablementItem.title)
        .height(19)
        .fontWeight(400)
        .width('100%')
        .fontSize(14)
        .padding({ left: 12, right: 12 })
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
      Text(this.enablementItem.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}