//
//  TimePicker.swift
//  MyAppHealth
//
//  Created by gelin maxence on 19/03/2025.
//

import SwiftUI

struct TimePicker: View {
    var style: AnyShapeStyle = .init(.bar)
    @Binding var hour: Int
    @Binding var min: Int
    @Binding var sec: Int
    var body: some View {
        HStack(spacing: 0) {
            CustomView("Hours", range: 0...23, $hour)
            CustomView("Mins", range: 0...59, $min)
            CustomView("Secs", range: 0...59, $sec)
        }
        .offset(x: -25)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(style)
                .frame(height: 35)
        }
    }
    @ViewBuilder
    private func CustomView(_ title: String, range: ClosedRange<Int>, _ selection: Binding<Int>) -> some View {
        PickerViewWithoutIndicators(selection: selection){
            ForEach(range, id: \.self) { value in
                Text("\(value)")
                    .frame(width: 35, alignment: .trailing)
                    .tag(value)
            }
        }
        .overlay {
            Text(title)
                .font(.callout.bold())
                .frame(width: 50, alignment: .leading)
                .lineLimit(1)
                .offset(x: 50)
        }
    }
}

#Preview {
    ContentView()
}

// Helpers
struct PickerViewWithoutIndicators<Content: View, Selection:Hashable>: View {
    @Binding var selection: Selection
    @ViewBuilder var content: Content
    @State private var isHidden: Bool = false
    var body: some View {
        Picker("", selection: $selection) {
            if !isHidden {
                RemovePickerIndicator {
                    isHidden = true
                }
            }
            content
        }
        .pickerStyle(.wheel
        )
    }
}

fileprivate
struct RemovePickerIndicator: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        DispatchQueue.main.async {
            if let pickerView = view.pickerView {
                if pickerView.subviews.count >= 2 {
                    pickerView.subviews[1].backgroundColor = .clear
                }
                print(pickerView)
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

fileprivate
extension UIView {
    var pickerView: UIPickerView? {
        if let view = superview as? UIPickerView {
            return view
        }
        
        return superview?.pickerView
    }
}
