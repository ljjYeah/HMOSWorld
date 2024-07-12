import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';
import { TutorialView } from '../view/TutorialView';
import { BannerDetailPage } from '../pages/BannerDetailPage';
import { ArticleDetailPage } from '../pages/ArticleDetailPage';

@Component
export struct QuickStartPage {
  @State message: string = '快速入门';
  @Provide('articlePathStack') articlePathStack: NavPathStack = new NavPathStack();

  @Builder
  quickStartRouter(name: string) {
    if (name === 'bannerDetailPage') {
      BannerDetailPage();
    } else {
      ArticleDetailPage();
    }
  }

  build() {
    Navigation(this.articlePathStack){
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(700)
          .width('100%')
          .textAlign(TextAlign.Start)
          .padding({ left: 16 })
          .fontFamily('HarmonyHeiTi-Bold')
          .lineHeight(33)

        Scroll(){
          Column(){
            Banner();
            EnablementView();
            TutorialView();
          }
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }
    .navDestination(this.quickStartRouter)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}