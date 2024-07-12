import { ArticleClass } from '../model/ArticleClass';
import { webview } from '@kit.ArkWeb';

@Component
export struct ArticleDetailPage{
  @Consume('articlePathStack') articlePathStack: NavPathStack;
  @State articleDetail: ArticleClass | null = null;
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void {
    this.articlePathStack.getParamByName('articleDetail')[0] as ArticleClass;
  }

  build() {
    NavDestination(){
      Column(){
        Row(){
          Image($r('app.media.ic_back'))
            .width(40)
            .height(40)
            .onClick(() => {
              this.articlePathStack.pop();
            })

          Text(this.articleDetail?.title)
            .fontFamily('HarmonyHeiTi-Bold')
            .fontSize(20)
            .textAlign(TextAlign.Start)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .fontWeight(700)
            .margin({ left: 8 })
        }
        .height(56)
        .width('100%')

        WebComponent({articleDetail: this.articleDetail, controller: this.controller})
      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .hideTitleBar(true)
  }
}

@Component
struct WebComponent{
  @Prop articleDetail: ArticleClass | null;
  @Prop controller: webview.WebviewController;

  build() {
    Web({
      src: this.articleDetail?.webUrl,
      controller: this.controller
    })
      .darkMode(WebDarkMode.Auto)
      .domStorageAccess(true)
      .zoomAccess(true)
      .fileAccess(true)
      .mixedMode(MixedMode.All)
      .cacheMode(CacheMode.None)
      .javaScriptAccess(true)
      .width('100%')
      .layoutWeight(1)
  }
}