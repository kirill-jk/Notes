//
//  ViewController.swift
//  Notes
//
//  Created by Кирилл Курилюк on 09.03.2024.
//

import UIKit
import SnapKit

class NoteViewController: UIViewController {
	
	//MARK: - Private properties
	
	private var backgroundView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "background")
		imageView.contentMode = .scaleToFill
		
		return imageView
	}()
	
	private var noteView: UITextView = {
		let textView = UITextView()
		textView.text = UserDefaults.standard.string(forKey: "UserInput") ?? "Hello, World!"
		textView.font = UIFont.systemFont(ofSize: 21)
		textView.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0)
		textView.translatesAutoresizingMaskIntoConstraints = false
		
		return textView
		
	}()
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		noteView.delegate = self
		super.viewDidLoad()
		setupUI()
	}
	
	//MARK: - UI
	func setupUI() {

		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Notes"


		view.addSubview(backgroundView)
		view.addSubview(noteView)
		
		backgroundView.snp.makeConstraints { make in
			make.left.right.top.bottom.equalToSuperview()
		}
		
		noteView.snp.makeConstraints { make in
			make.left.right.equalToSuperview().inset(15)
			make.bottom.equalToSuperview().inset(50)
			make.top.equalTo(view.safeAreaLayoutGuide)

		}

	}
	func updateUI() {
		noteView.text = UserDefaults.standard.string(forKey: "UserInput")
	}
}

//MARK: - UITextViewDelegate
extension NoteViewController: UITextViewDelegate {
	

	func textViewDidChange(_ textView: UITextView) {
		guard let text = textView.text else {
			return
		}
		
		UserDefaults.standard.set(text, forKey: "UserInput")
	}
}
