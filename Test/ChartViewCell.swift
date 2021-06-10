//
//  ChartViewCell.swift
//  Test
//
//  Created by SonNV MacMini on 05/06/2021.
//

import UIKit
import Charts

class ChartViewCell: UITableViewCell {

    @IBOutlet weak var horizonBarChart: HorizontalBarChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupBarChartHorizon() {
        let number = 0
        let months  = ["テトラサイクリン塩\n酸塩", "メトトレキサート製\n剤", "メトトレキサート", "レチノール酢酸エス\nテル",
                        "アミノ安息香酸エチ\nル・パラブチルアミ...", "酸化マグネシウム", "インドメタシン製剤", "インドメタシン",
                        "プレドニゾロン系製\n剤", "プレドニゾロン", "ロキソプロフェンナ\nトリウム水和物", "トラマドール塩酸塩\n・アセトアミノフェ...",
                        "トラマドール塩酸塩", "アス", "オセ", "アス",
                        "アスピ", "アス", "ア",
                        "ア"].dropFirst(number).map({$0})
        let unitsSold  = [2.0, 1.0, 3.0, 4.0, 5.0, 10.0, 200.0, 100.0, 40.0, 50.0,
                          120.0, 35.0, 50.0, 21.0, 68.0, 79.0, 99.0, 43.0, 400.0, 60.0].dropFirst(number).map({$0})
        setChartHorizon(dataPoints: months, values: unitsSold)
    }

     private func setChartHorizon(dataPoints: [String], values: [Double]) {

        horizonBarChart.noDataText = "You need to provide data for the chart."

        // Prevent from setting an empty data set to the chart (crashes)
        guard dataPoints.count > 0 else { return }
//        let barWidth = 0.5
//        let spaceForBar = 100.0
        var dataEntries = [BarChartDataEntry]()

        for i in 0..<dataPoints.reversed().count {
            let entry = BarChartDataEntry(x: Double(i), y: values.reversed()[i])
            dataEntries.append(entry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Units Sold")
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [UIColor.red]
        chartDataSet.colors = [UIColor.lightGray]
        chartDataSet.highlightColor = UIColor.orange.withAlphaComponent(0.3)
        chartDataSet.highlightAlpha = 1

        let chartData = BarChartData(dataSet: chartDataSet)
//        chartData.barWidth = 0.65
//        horizonBarChart.groupBars(fromX: 0, groupSpace: 0.3, barSpace: 0.05)

        horizonBarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints.reversed())
        horizonBarChart.xAxis.granularityEnabled = true
        horizonBarChart.xAxis.granularity = 0

        chartData.setDrawValues(false)
        horizonBarChart.fitBars = true
        horizonBarChart.data = chartData
        horizonBarChart.data?.notifyDataChanged()

        horizonBarChart.xAxis.avoidFirstLastClippingEnabled = true
        
        horizonBarChart.setVisibleXRangeMaximum(5)
        horizonBarChart.setVisibleXRangeMinimum(5)

        horizonBarChart.drawBarShadowEnabled = false
        horizonBarChart.drawValueAboveBarEnabled = false
        horizonBarChart.chartDescription?.enabled = false
        horizonBarChart.pinchZoomEnabled = false
        horizonBarChart.doubleTapToZoomEnabled = false
        horizonBarChart.drawGridBackgroundEnabled = false
        horizonBarChart.legend.enabled = false

        horizonBarChart.xAxis.drawAxisLineEnabled = false
        horizonBarChart.xAxis.drawGridLinesEnabled = false
        horizonBarChart.xAxis.granularityEnabled = true

        horizonBarChart.leftAxis.drawAxisLineEnabled = false
        horizonBarChart.leftAxis.drawGridLinesEnabled = true
        horizonBarChart.leftAxis.drawLabelsEnabled = true
        horizonBarChart.leftAxis.drawZeroLineEnabled = false
        horizonBarChart.leftAxis.axisMinimum = 0

        horizonBarChart.rightAxis.drawAxisLineEnabled = true
        horizonBarChart.rightAxis.drawGridLinesEnabled = false
        horizonBarChart.rightAxis.drawLabelsEnabled = true
        horizonBarChart.rightAxis.axisMinimum = 0

//        horizonBarChart.extraBottomOffset = 10

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            let maxY = self.horizonBarChart.chartYMax
            print(maxY)
            self.horizonBarChart.moveViewToY(maxY, axis: .left)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
