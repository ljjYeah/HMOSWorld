// import { CourseLearning } from '@ohos/learning'
import { CourseLearning } from '@ohos/learning';

// import { QuickStartPage } from '@ohos/quickStart'

@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      CourseLearning();
      // QuickStartPage();
    }
  }
}