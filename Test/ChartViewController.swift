//
//  ChartViewController.swift
//  Test
//
//  Created by SonNV MacMini on 26/05/2021.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {


    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var horizonBarChart: HorizontalBarChartView!
    @IBOutlet weak var tableView: UITableView!
    var scale: CGFloat = 200.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarChart()
//        setupTableView()
    }

    func charLine() {
        let dollars1: [Int: Double] = [0: 444.0, 2: 108.0, 3: 33.0, 4: 15.0, 5: 8.0, 6: 3.0, 7: 3.0, 8: 4.0, 9: 4.0, 10: 2.0, 12: 1.0, 14: 2.0, 19: 2.0, 26: 1.0, 29: 1.0]

        let dollars2: [Int: Double] = [0: 2.0, 1: 2.0, 3: 1.0, 4: 6.0, 6: 2.0, 11: 1.0]

        let monthsInt: [Int] = Array(0...30)
        var months: [String] = []
        for i in 0..<31 {
            if i % 3 == 0 {
                months.append("\(i)")
            } else {
                months.append("")
            }
        }

        var allLineChartDataSets: [LineChartDataSet] = [LineChartDataSet]()

        var dataEntries: [ChartDataEntry] = []
        for i in 0..<monthsInt.count {
            if let value = dollars1[i] {
                let dataEntry = ChartDataEntry()
                dataEntry.x = Double(i)
                dataEntry.y = value
                dataEntries.append(dataEntry)
            }
        }

        let lineChartDataSet1: LineChartDataSet = LineChartDataSet(entries: dataEntries, label: "lineChartDataSet1")
        lineChartDataSet1.circleRadius = 4
        lineChartDataSet1.circleHoleRadius = 2
        lineChartDataSet1.lineWidth = 3
        lineChartDataSet1.drawValuesEnabled = false
        allLineChartDataSets.append(lineChartDataSet1)


        var dataEntries2: [ChartDataEntry] = []
        for i in 0..<monthsInt.count {
            if let value = dollars2[i] {
                let dataEntry = ChartDataEntry()
                dataEntry.x = Double(i)
                dataEntry.y = value
                dataEntries2.append(dataEntry)
            }
        }

        let lineChartDataSet2 = LineChartDataSet(entries: dataEntries2, label: "lineChartDataSet2")
        lineChartDataSet2.setColor(UIColor.red)
        lineChartDataSet2.setCircleColor(UIColor.red)
        lineChartDataSet2.circleRadius = 4
        lineChartDataSet2.circleHoleRadius = 2
        lineChartDataSet2.lineWidth = 3
        lineChartDataSet2.drawValuesEnabled = false
        allLineChartDataSets.append(lineChartDataSet2)

        let lineChartData = LineChartData(dataSets: allLineChartDataSets)

        chartView.data = lineChartData

        chartView.delegate = self
        chartView.xAxis.enabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.doubleTapToZoomEnabled = false
        chartView.rightAxis.enabled = false
        chartView.xAxis.drawLabelsEnabled = true
        chartView.xAxis.labelCount = months.count
        chartView.xAxis.axisMaximum = Double(months.count)
        chartView.leftAxis.axisMinimum = 0
        chartView.legend.enabled = false
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInCubic)
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false

        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
    }

    func setupBarChart() {
        self.scrollView.flashScrollIndicators()
        scrollView.delegate = self
        barChartView.delegate = self
        let number = 0
        let months  = ["A", "B", "C", "D", "E", "F", "G", "H"].dropFirst(number).map({$0})
        let unitsSold  = [20.0, 54.0, 6.0, 30.0, 92.0, 16.0, 90.0, 20.0].dropFirst(number).map({$0})
        setChart(dataPoints: months, values: unitsSold)
//
//        let width = scale * CGFloat((months.count))
//        scrollView.contentSize = CGSize(width: width, height: barChartView.frame.height)
    }


    func setChart(dataPoints: [String], values: [Double]) {

        barChartView.noDataText = "You need to provide data for the chart."

        // Prevent from setting an empty data set to the chart (crashes)
        guard dataPoints.count > 0 else { return }

        var dataEntries = [BarChartDataEntry]()

        for i in 0..<dataPoints.count {
            let entry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(entry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Units Sold")

        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [UIColor.red]
        chartDataSet.colors = [UIColor.lightGray]
        chartDataSet.highlightColor = UIColor.orange.withAlphaComponent(0.3)
        chartDataSet.highlightAlpha = 1

        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.setDrawValues(false)
//        chartData.barWidth = 0.4
        barChartView.fitBars = true
        barChartView.data = chartData

        barChartView.setVisibleXRangeMaximum(5)
        barChartView.setVisibleXRangeMinimum(5)

        barChartView.drawBarShadowEnabled = false
        barChartView.drawValueAboveBarEnabled = true
        barChartView.chartDescription?.enabled = false
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = false
        barChartView.legend.enabled = false

        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.drawAxisLineEnabled = true
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.granularityEnabled = true

        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.leftAxis.drawGridLinesEnabled = true
        barChartView.leftAxis.drawLabelsEnabled = false
        barChartView.leftAxis.axisMinimum = 0

        barChartView.rightAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = true
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.rightAxis.axisMinimum = 0.0
        barChartView.extraBottomOffset = 10



    }


    func chartValueNothingSelected(_ chartView: ChartViewBase) {
    }

    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        print("Sonnv dX \(dX)")
        print("Sonnv dY \(dY)")
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 300
        tableView.register(UINib(nibName: "ChartViewCell", bundle: nil), forCellReuseIdentifier: "ChartViewCell")
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}

extension ChartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChartViewCell") as! ChartViewCell
        cell.setupBarChartHorizon()
        return cell
    }
}

extension ChartViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let value = Double(x/scale)
        print(value)
        barChartView.moveViewToX(value-1)

//        let y = scrollView.contentOffset.y
//        let value = 10 - Double(y/100)
//        print(y)
//        print(value)
//        horizonBarChart.moveViewToY(value, axis: .left)
    }
}
