<img src="https://user-images.githubusercontent.com/78537078/217512021-95f76213-2b52-4123-9ef8-3da114ce1ca3.jpeg" width = "20%">

# Flow 채용 과제

- 사진첩(로컬)

</br>

<p>
<img src="https://user-images.githubusercontent.com/78537078/217512631-4768316d-eac9-45e0-951c-a9f36b1d5df3.png" width = "30%">
<img src="https://user-images.githubusercontent.com/78537078/217512858-e9f8a0a1-f877-4eb3-aef6-b9a2f6778eb6.png" width = "30%">
<img src="https://user-images.githubusercontent.com/78537078/217513010-322f8551-5236-434f-bf74-3f2e2f645b4d.png" width = "30%">
</p>

</br>

## 1. 개발 환경 및 설정
- Swift 5.5
- Xcode 14.2
- iOS 15.0
- 라이트모드
- 세로모드

</br>

## 2. 사용 기술
| kind | stack |
| --- | --- |
| 아키텍처 | `MVVM` |
| 프레임워크 | `PhotoKit` |
| 라이브러리 | `SnapKit`  |
| 의존성관리 | `Swift Package Manager` |
| Tools | `Git / Github` |
| ETC | `Compositional Layout` |

</br>

## 3. 고려 사항

- HIG 고려
    - HIG의 App Architecture에 의거하여 LaunchScreen을 넣어서 사용자가 앱과 빈틈없이 상호작용하는 느낌을 주려 하였습니다.
    - 간소한 디자인과 비율로 사이즈를 지정하여 Adaptive Layout을 고려하였습니다.
    - 앱에 확실하게 필요한 개인정보만 요구하였습니다.
    - 권한 요청 시 왜 앱에서 이 정보가 필요한지에 대해 짧고 구체적인 문장으로 정중하게 표현하였습니다.
    - 이미지 추가 버튼을 + 이미지로 구성하여 기능에 명확히 집중할 수 있는 디자인을 활용하였습니다.

</br>

- 앱의 확장성 및 유지보수 측면 고려
    - Raw한 값들을 화면 별로 분리하여 enum으로 관리하고 있기 때문에 추후 case의 변동이나 추가에도 쉽게 대응이 가능하게 하였습니다.
    - 화면 별로 중복되는 부분들은 SubClass를 만들어 코드의 중복을 줄였습니다.
    - SubClass 별로 분기처리 해야하는 부분은 enum을 Nested Type으로 사용하여 코드를 직관적으로 작성하려고 하였습니다.
    
</br>

- UI, UX적인 부분 고려
    - 앨범리스트 화면에서 만약 접근 권한을 선택한 사진만 보이게 했을 경우 선택한 사진 추가하고 싶은 점을 고려하여 우측 상단에 사진 추가 버튼을 만들었습니다.
    - 사진이 없는 앨범의 경우에는 그냥 빈화면이 아닌 대체이미지와 텍스트를 이용하여 좀 더 명시적으로 빈 앨범이라는 것을 표현하였습니다.
    - 만약 권한을 허용하지 않을 경우에 이 앱에서 권한이 왜 필요한지에 대한 구체적인 문장으로 Alert을 띄워 권한 허용을 유도하였습니다.

</br>

## 4. 트러블 슈팅

### 4.1 사용자 앨범 리스트 에러

- 문제점: 접근 권한을 선택한 사진으로 둘 경우 사진에는 문제가 없지만 사용자 앨범이 Fetch 되지 않는 현상 발생
- 해결: PhotoKit에서 선택한 사진으로 접근 권한을 둘 경우 사용자 앨범이 Fetch 할 수 없고 적절하게 UI를 업데이트 해야한다는 내용을 공식 문서에서 발견하였습니다.
    <img width="920" alt="스크린샷 2023-02-07 오후 6 12 32" src="https://user-images.githubusercontent.com/78537078/217513771-6fa30e1c-7d7e-4160-9569-fbe1a43d7dea.png"></br>
    - 선택한 사진으로 접근 권한을 설정할 경우 사용자 앨범 Section을 Hidden 처리하여 해결하였습니다.

</br>

### 4.2 이미지 동기화 성능 저하

- 문제점: PHAsset을 UIImage로 변환하고 셀에 나타내는 과정에서 확실한 데이터 전달을 위해 `PHImageRequestOptions` 의 `isSynchronous` 를 true로 설정하여 동기적으로 이미지 변환을 해서 나타내는 형태로 코드를 구현했었습니다.
    - 데이터 전달에는 문제가 없지만 `isSynchronous` 를 true로 설정할 경우 `deliveryMode` 가 `highQualityFormat` 으로 설정되어 이미지가 많을 경우에 고화질의 이미지를 동기적으로 받아오기 때문에 앱이 버벅거리는 현상이 발생하였습니다.
        <img width="1070" alt="스크린샷 2023-02-08 오후 6 10 44" src="https://user-images.githubusercontent.com/78537078/217513987-0c2c4255-9311-45b1-884c-e57d31d911f0.png">
        
- 해결: `isSynchronous` 를 먼저 false로 설정하여 비동기적으로 이미지 변환을 하게 하여 앱이 버벅이는 현상을 없앴습니다.
    - `deliveryMode` 를 `opportunistic` 으로 설정하여 이미지가 많을 경우에는 고품질 이미지를 준비하는 동안 저품질 이미지를 우선적으로 보여주게 설정하였습니다.
    - 비동기적으로 처리하게 되면 이미지 변환 속도에 따라 빈 이미지가 나올 수 있기 때문에 `resultHandler` 내부에서 Cell에 직접적으로 데이터 바인딩을 하게 구현하여 해결하였습니다.
        <img width="963" alt="스크린샷 2023-02-08 오후 6 29 28" src="https://user-images.githubusercontent.com/78537078/217514221-dba6c256-2cd7-43e5-99bb-89e50d53b4c1.png"></br>
        <img width="830" alt="스크린샷 2023-02-08 오후 6 30 02" src="https://user-images.githubusercontent.com/78537078/217514319-8f069ec9-e396-42f5-ba10-245c1260b868.png"></br>
        <img width="776" alt="스크린샷 2023-02-08 오후 6 30 33" src="https://user-images.githubusercontent.com/78537078/217514373-15c0a9ce-4780-4652-a4fa-18faab5e1912.png">
        
</br>
        
## 5. 회고

### Keep

- ***enum 활용***
    - Image, Color와 같은 리소스들을 enum을 통해 관리하여 유지보수에 수월하게 하였습니다.
    - Raw한 값들을 enum을 통해 만들어서 하나의 enum 에서 모든 Raw한 값들을 관리하여 유지보수에 좀 더 수월하게 하였습니다.
    - 대신 너무 무분별하게 사용하기 보다는 항상 명확한 NameSpace를 사용하고 Nested Type으로 구현이 가능한 것인지 생각하며 개발을 하면 코드의 양을 많이 줄일 수 있고 가독성 좋게 개발을 할 수 있어서 정말 유용하다고 생각합니다.
- ***MVVM 활용***
    - ViewModel을 활용해서 비즈니스 로직을 최대한 분리하여 구현하였습니다.
    - ViewModel을 통해 데이터 바인딩을 하기 때문에 코드의 양을 많이 줄일 수 있고 로직이 분리되어 있기 때문에 유지보수에도 좋다고 생각합니다.
- ***접근 제어자 활용***
    - 접근 제어자를 활용하여 코드에 대한 접근을 명시적으로 작성하였습니다.
    - 접근 제어자를 활용하면 프로퍼티에 대해 어디에서 사용되는 지 명시적으로 알 수 있기 때문에 추후에 협업을 할 경우에도 정말 유용하다고 생각합니다.
- ***HIG 고려***
    - 권한 요청 시의 메시지나 Alert의 메시지들 모두 최대한 짧고 구체적인 문장으로 정중하게 표현하였습니다.
    - 이미지 추가 버튼을 + 이미지로 구성하여 기능에 명확히 집중할 수 있는 디자인을 활용하였습니다.
    - HIG를 고려하여 개발하면 확실히 앱의 사용성 측면에서도 좋고 디자인적인 측면에서 명확해져서 앞으로도 계속 공부하면서 적용해야 할 부분이라고 생각합니다.

</br>

### Problem

- ***Commit 단위의 모호함***
    - Convention을 최대한 맞춰서 Commit을 하였지만 Commit의 단위가 정말 모호한 것 같다.
    - Commit의 단위를 기능 단위로 맞춰서 하려고 하지만 기능 개발을 하다보면 가끔 에러를 해결하다가 Commit을 놓치고 가는 경우가 있어서 좀 늦게 한 Commit들이 있었는데 아쉬웠다.
- ***공식문서 활용 부족***
    - PhotoKit에 대해 상세하게 사용해본 적이 처음여서 공식문서를 활용해서 공부하면서 개발을 했는데 사진 선택 권한을 선택할 경우에 사용자 앨범이 Fetch 되지 않는다는 내용을 못보고 계속 구현해보려고 시도하다가 시간을 많이 썼다.
    - 내가 구현하려는 기능에 대해서 확실하게 공식문서 내용을 잘 읽어보고 구현해보는 것이 필요할 것 같다.
- ***명확한 Namepace 활용 부족***
    - enum 케이스 명에 대해 크게 신경쓰지 않고 개발하다가 이게 어떤 기준으로 나눈 케이스인지 헷갈리는 경우가 있었다.
    - 혼자 개발을 하다보면 크게 신경을 쓰지 않고 넘어갈 수 있지만 그게 정말 좋지 않은 습관이 될 수 있기 때문에 항상 다른 사람이 볼 코드라고 생각하며 어떤 기능인지를 명확하게 알 수 있는 NameSpace를 사용해야할 것 같다.

</br>

### Try

- ***Commit 습관 만들기***
    - 개발을 하다보면 에러를 만나거나 마감 기한에 쫓겨 Commit을 잊게 되는 순간들이 있는데 만약 추후에 회사에 입사하여 협업을 하게 되면 기한을 지키는 것 만큼 내가 개발한 것에 대해 최대한 일정한 단위로 Commit을 남기는 것 또한 정말 중요하다고 생각합니다.
    - 그런 일정한 단위의 Commit을 통해 좀 더 정확한 코드리뷰가 가능해진다고 생각하기 때문에 앞으로를 위해서 Commit 습관을 만들어봐야겠다.
- ***공식문서를 통한 기술에 대한 확실한 이해***
    - 이전에 프로젝트를 개발할 때도 네이버지도 API를 사용하면서 공식문서에 대해 정말 많은 도움을 받았던 기억이 있습니다.
    - 어떤 기술을 사용하기 전에 공식문서를 통해 확실하게 공부를 하고 사용을 하게되면 프로퍼티나 메서드들이 어떤 목적으로 존재하는 지를 확실하게 알고 사용할 수 있기 때문에 확실히 개발 시간을 줄일 수 있어서 공식문서는 정말 중요한 것 같습니다.
    - 이번에도 이전과 같이 공식문서를 통해 공부하고 사용을 했지만 기한이 정해져 있었기 때문에 중요한 부분만 빠르게 읽으려고 하다보니 아쉽게 놓친 부분이 있었고 그 부분으로 인해 오히려 시간을 낭비했기 때문에 앞으로는 좀 더 꼼꼼하게 공부하여 확실한 이해를 바탕으로 개발을 하는 습관을 들여야겠다.
- ***명확한 Namepace 활용 부족***
    - enum 케이스 명을 단순히 one, two로 설정해두면 이게 어떻게 나눈 케이스인지 정말 헷갈리고 나중에는 내가 봐도 모르는 경우가 생길 수 있기 때문에 명확한 NameSpace 활용은 정말 중요한 것 같습니다.
    - 서브클래싱 같은 경우에도 어떤 목적으로 생성한 서브클래싱이고 어디에 활용되는지를 주석으로 달아두면 좋다고 생각합니다.
    - 항상 다른 사람이 볼 코드라고 생각하며 기능을 명확하게 담고 있는 NameSpace를 고려하고 사용하는 습관을 들여야겠다.
    
