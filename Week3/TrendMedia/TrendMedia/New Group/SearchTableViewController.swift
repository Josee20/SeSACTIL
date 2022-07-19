//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit

class SearchTableViewController: UITableViewController {

    var movieTitleList: [String] = ["해리 포터 20주년: 리턴 투 호그와트 Harry Potter 20th Anniversary: Return to Hogwarts",
                                    "해리 포터와 잉크 마법사의 여행",
                                    "해리 포터와 죽음의 성물1 ",
                                    "해리 포터와 죽음의 성물 2",
                                    "해리 포터와 불의 잔",
                                    "해리 포터와 마법사의 돌",
                                    "해리 포터와 비밀의방"
    ]
    
    var moviePosterList: [UIImage] = [UIImage(named: "리턴투호그와트.jpeg")!,
                                      UIImage(named: "잉크마법사.jpeg")!,
                                      UIImage(named: "죽음의성물1.jpeg")!,
                                      UIImage(named: "죽음의성물2.jpeg")!,
                                      UIImage(named: "불의잔.jpeg")!,
                                      UIImage(named: "마법사의돌.jpeg")!,
                                      UIImage(named: "비밀의방.jpeg")!
    ]
    
    var movieReleaseDateList: [String] = ["2022. 01. 01 | EN", "2020. 12. 01 | EN", "2010. 10. 17 | EN", "2011. 07. 07 | EN", "2005. 11. 16 | EN", "2001. 11. 16 | EN", "2002. 11. 13 | EN"]
    
    var movieSummaryList: [String] = ["다니엘 래드클리프(Daniel Radcliffe), 루퍼트 그린트(Rupert Grint), 엠마 왓슨(Emma Watson)은 해리 포터 시리즈의 첫 번째 영화인 해리 포터와 마법사의 돌(Harry Potter and the Sorcerer's Stone)의 기념일을 축하하기 위해 처음으로 호그와트로 돌아가면서 영화 제작자 크리스 콜럼버스와 여덟 편의 해리 포터 영화에 출연한 다른 존경받는 배우들과 함께 합니다. 20년 전 첫 방송. 회고 특집 해리 포터 20주년: 호그와트로 돌아가기(Return to Hogwarts)는 완전히 새로운 심층 인터뷰와 출연진 대화를 통해 매혹적인 메이킹 스토리를 전하고 역사상 가장 사랑받는 영화 프랜차이즈 중 하나를 통해 마법 같은 1인칭 여정으로 팬들을 초대합니다.", "리터러리 잉크는 해리 포터를 테마로 한 최초의 타투 컨벤션으로 테네시주 채터누가에서 개최됐다. 이 컨벤션에 참가하기 위해 전 세계에서 70명 이상의 타투이스트들이 모이고 해리 포터라는 공통된 팬덤을 중심으로 문학과 마법, 예술에 대한 이야기를 나누었다. 컨벤션을 개최하기까지의 과정을 담은 이 다큐멘터리를 통해 리터러리 잉크를 계획하고 컨벤션을 개최한 메인 라인 타투숍의 제니퍼와 팀원들, 그리고 타투 컨벤션에 참가한 다양한 타투이스트들의 타투 이야기와 삶, 꿈에 대해 듣는다.", "안녕", "반가워", "내 이름은", "조제", "넌?"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 자동으로 못정해주나?? 간격맞춰서
        tableView.rowHeight = 130
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.movieTitle.text = movieTitleList[indexPath.row]
        cell.movieReleaseDate.text = movieReleaseDateList[indexPath.row]
        cell.moviePosterImage.image = moviePosterList[indexPath.row]
        cell.movieSummary.text = movieSummaryList[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitleList.count
    }
}
