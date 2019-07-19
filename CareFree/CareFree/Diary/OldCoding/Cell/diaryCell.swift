//
//  diaryCell.swift
//  CareFree
//
//  Created by 张驰 on 2019/6/6.
//  Copyright © 2019 张驰. All rights reserved.
//

import Foundation
import UIKit

class diaryCell: UIView {
    
    lazy var day: UILabel = {
        let label = UILabel()
        label.text = "24"
        label.font = UIFont(name: "PingFangSC-Semibold", size: 32)
        //label.backgroundColor = UIColor.red
        return label
    }()
    
    lazy var week: UILabel = {
        let label = UILabel()
        label.text = "周五"
        label.font = UIFont(name: "PingFangSC-Regular", size: 12)
        //label.backgroundColor = UIColor.green
        return label
    }()
    
    lazy var yearMouth: UILabel = {
        let label = UILabel()
        label.text = "2019年5月"
        label.font = UIFont(name: "PingFangSC-Regular", size: 12)
        //label.backgroundColor = UIColor.blue
        return label
    }()
    
    lazy var dayLine:UIView = {
       let vi = UIView()
        vi.backgroundColor = .black
        return vi
    }()
    
    lazy var content: UILabel = {
        let label = UILabel()
        label.text = "今天考试，准备了很久，希望能够得到好成绩"
        label.font = UIFont(name: "PingFangSC-Regular", size: 15)
        label.numberOfLines = 0
       // label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.init(r: 127, g: 127, b: 127)
        return label
    }()
    
    lazy var emotionValue: UILabel = {
        let label = UILabel()
        label.text = "情绪值 32"
        label.textColor = UIColor.init(r: 57, g: 210, b: 214)
        label.font = UIFont(name: "PingFangSC-Medium", size: 13)
        //label.backgroundColor = UIColor.red
        return label
    }()
    lazy var emotionData : UITableView = {
        let tableView = UITableView()
       // tableView.backgroundColor = UIColor.red
        tableView.register(UINib(nibName: "emotionCell", bundle: nil), forCellReuseIdentifier: "emotionCell")
        tableView.separatorStyle = .none
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        configUI()
        configShadow()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(with data:diaryModel)
    {
//        if data.isFirst
//        {
//            content.isHidden = true
//            emotionData.isHidden = true
//            emotionValue.text = "情绪值"
//            emotionValue.textColor = .black
//        }
//        else
//        {
//        writeBtn.isHidden = true
//        writeCollection.isHidden = true
//        }
    }
    
    func updateWriteUI(){

    }

    func configUI(){
        addSubview(day)
        addSubview(week)
        addSubview(yearMouth)
        addSubview(dayLine)
        addSubview(content)
        addSubview(emotionValue)
        //addSubview(writeBtn)
        //addSubview(writeCollection)
        emotionData.delegate = self
        emotionData.dataSource = self
        
        addSubview(emotionData)
        day.snp.makeConstraints{(make) in
            make.top.equalTo(self) .offset(15)
            make.left.equalTo(self).offset(20)
            make.height.equalTo(35)
            make.width.equalTo(40)
        }
        dayLine.snp.makeConstraints{(make) in
            make.top.equalTo(day.snp.bottom).offset(5)
            make.left.equalTo(self).offset(20)
            make.height.equalTo(2)
            make.width.equalTo(30)
        }
        week.snp.makeConstraints{(make) in
            make.top.equalTo(self).offset(13)
            make.left.equalTo(day.snp.right).offset(15)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        yearMouth.snp.makeConstraints{(make) in
            make.top.equalTo(week.snp.bottom).offset(-1)
            make.left.equalTo(day.snp.right).offset(15)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        content.snp.makeConstraints{(make) in
            make.top.equalTo(dayLine.snp.bottom).offset(5)
            make.left.equalTo(self).offset(18)
            make.width.equalTo(180)
            make.height.equalTo(100)
        }
        emotionValue.snp.makeConstraints{(make) in
            make.top.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(30)
            make.width.equalTo(90)
        }
        emotionData.snp.makeConstraints{(make) in
            make.top.equalTo(emotionValue.snp.bottom).offset(3)
            make.right.equalTo(self).offset(-15)
            make.width.equalTo(100)
            make.height.equalTo(120)
        }
             }
    
    func configShadow(){
    
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.clear.cgColor
        
        self.layer.shadowColor = UIColor.init(red: 110, green: 127, blue: 255, alpha: 0).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.layer.masksToBounds = false
    }
    
}
extension diaryCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emotionCell", for: indexPath) as! emotionCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}