//
//  ViewController7.swift
//  Test
//
//  Created by SonNV MacMini on 08/06/2021.
//

import MXSegmentedPager

class ViewController7: UIViewController, UIScrollViewDelegate, MXSegmentedPagerDelegate, MXSegmentedPagerDataSource {

    @IBOutlet weak var segmentPager: MXSegmentedPager!

    var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentPager.segmentedControl.textColor = .black
        segmentPager.segmentedControl.selectedTextColor = .white
        segmentPager.segmentedControl.indicator.lineView.backgroundColor = .black
        segmentPager.segmentedControl.indicatorHeight = 31
        segmentPager.segmentedControl.segmentWidth = 31
        segmentPager.segmentedControl.backgroundColor = .opaqueSeparator
        segmentPager.segmentedControlEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        segmentPager.segmentedControl.font = UIFont.boldSystemFont(ofSize: 12)

        segmentPager.dataSource = self
        segmentPager.delegate = self

        let vc1 = ViewController8()
        vc1.navigationController?.isNavigationBarHidden = true
//        vc1.push = {[weak self] in
//            let vc = ChartViewController()
//            vc.modalPresentationStyle = .fullScreen
//            vc.modalTransitionStyle = .coverVertical
//            //        self.present(vc, animated: true, completion: nil)
//            self?.navigationController?.pushViewController(vc, animated: true)
//        }
//        let navi1 = UINavigationController(rootViewController: vc1)
        self.navigationController?.viewControllers.insert(vc1, at: 0)
        viewControllers.append(vc1)

        let vc2 = ViewController4()
        let navi2 = UINavigationController(rootViewController: vc2)
        vc2.navigationController?.isNavigationBarHidden = true
        viewControllers.append(navi2)

        self.segmentPager.reloadData()

    }

    func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        return viewControllers.count
    }

    func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        return viewControllers[index].view
    }

    func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["Table", "Web"][index]
    }

    func heightForSegmentedControl(in segmentedPager: MXSegmentedPager) -> CGFloat {
        return 31
    }
}
