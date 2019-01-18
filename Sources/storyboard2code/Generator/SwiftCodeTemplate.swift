//
//  SwiftCodeTemplate.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/19/18.
//

import Foundation

let kSwiftCodeTemplate = """
{#

   _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                  Macro
   _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

 #}
{#
  ///
  /// Rendering ViewController properties
  ///
#}
{% macro render_vc vc %}
        {% call render_vc_properties vc %}
        {% set type vc | type %}
        {% if type == "CollectionViewController" %}
        {% call render_collectionvc_properties vc %}
        {% elif type == "NavigationController" %}
        {% call render_navigationvc_properties vc %}
        {% elif type == "SplitViewController" %}
        {% call render_splitvc_properties vc %}
        {% elif type == "TabBarController" %}
        {% call render_tabbarvc_properties vc %}
        {% elif type == "TableViewController" %}
        {% call render_tablevc_properties vc %}
        {% endif %}
{% endmacro %}
{#
  ///
  /// ViewController
  ///
#}
{% macro render_vc_properties vc %}
        {% if vc.title %}
        title = "{{ vc.title }}"
        {% endif %}
        {% if vc.automaticallyAdjustsScrollViewInsets %}
        automaticallyAdjustsScrollViewInsets = {{ vc.automaticallyAdjustsScrollViewInsets | swiftBool }}
        {% endif %}
        {% if vc.hidesBottomBarWhenPushed %}
        hidesBottomBarWhenPushed = {{ vc.hidesBottomBarWhenPushed | swiftBool }}
        {% endif %}
        {% if vc.modalTransitionStyle %}
        modalTransitionStyle = .{{vc.modalTransitionStyle}}
        {% endif %}
{% endmacro %}
{#
  ///
  /// CollectionView
  ///
#}
{% macro render_collectionvc_properties vc %}
        {% if vc.clearsSelectionOnViewWillAppear %}
        clearsSelectionOnViewWillAppear = {{ vc.clearsSelectionOnViewWillAppear | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// NavigationController
  ///
#}
{% macro render_navigationvc_properties vc %}
        {% if vc.hidesBarsOnSwipe %}
        hidesBarsOnSwipe = {{ vc.hidesBarsOnSwipe | swiftBool }}
        {% endif %}
        {% if vc.hidesBarsOnTap %}
        hidesBarsOnTap = {{ vc.hidesBarsOnTap | swiftBool }}
        {% endif %}
        {% if vc.hidesBarsWhenKeyboardAppears %}
        hidesBarsWhenKeyboardAppears = {{ vc.hidesBarsWhenKeyboardAppears | swiftBool }}
        {% endif %}
        {% if vc.hidesBarsWhenVerticallyCompact %}
        hidesBarsWhenVerticallyCompact = {{ vc.hidesBarsWhenVerticallyCompact | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// SplitViewController
  ///
#}
{% macro render_splitvc_properties vc %}
        {# No custom properties #}
{% endmacro %}
{#
  ///
  /// TabBarController
  ///
#}
{% macro render_tabbarvc_properties vc %}
        {# No custom properties #}
{% endmacro %}
{#
  ///
  /// TableViewController
  ///
#}
{% macro render_tablevc_properties vc %}
        {% if vc.clearsSelectionOnViewWillAppear %}
        clearsSelectionOnViewWillAppear = {{ vc.clearsSelectionOnViewWillAppear | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Rendering View properties
  ///
#}
{% macro render_view view %}
        {% call render_view_properties view %}
        {% set type view | type %}
        {% if type == "ActivityIndicatorView" %}
        {% call render_activityindicatorview_properties view %}
        {% elif type == "Button" %}
        {% call render_button_properties view %}
        {% elif type == "CollectionView" %}
        {% call render_scrollview_properties view %}
        {% call render_collectionview_properties view%}
        {% elif type == "DatePicker" %}
        {% call render_datepicker_properties view %}
        {% elif type == "ImageView" %}
        {% call render_imageview_properties view %}
        {% elif type == "Label" %}
        {% call render_label_properties view %}
        {% elif type == "MapView" %}
        {% call render_mapview_properties view %}
        {% elif type == "NavigationBar" %}
        {% call render_navigationbar_properties view %}
        {% elif type == "PageControl" %}
        {% call render_pagecontrol_properties view %}
        {% elif type == "PickerView" %}
        {% call render_pickerview_properties view %}
        {% elif type == "ProgressView" %}
        {% call render_progressview_properties view %}
        {% elif type == "ScrollView" %}
        {% call render_scrollview_properties view %}
        {% elif type == "SearchBar" %}
        {% call render_searchbar_properties view %}
        {% elif type == "SegmentedControl" %}
        {% call render_segmentedcontrol_properties view %}
        {% elif type == "Slider" %}
        {% call render_slider_properties view %}
        {% elif type == "StackView" %}
        {% call render_stackview_properties view %}
        {% elif type == "Stepper" %}
        {% call render_stepper_properties view %}
        {% elif type == "Switch" %}
        {% call render_switch_properties view %}
        {% elif type == "TabBar" %}
        {% call render_tabbar_properties view %}
        {% elif type == "TableView" %}
        {% call render_scrollview_properties view %}
        {% call render_tableview_properties view %}
        {% elif type == "TextField" %}
        {% call render_textfield_properties view %}
        {% elif type == "TextView" %}
        {% call render_scrollview_properties view %}
        {% call render_textview_properties view %}
        {% elif type == "Toolbar" %}
        {% call render_toolbar_properties view %}
        {% elif type == "WkWebView" %}
        {% call render_wkwebview_properties view %}
        {% endif %}
        {% call render_actions view %}
        {% call render_subviews view %}
{% endmacro %}
{#
  ///
  /// View
  ///
#}
{% macro render_view_properties view %}
        {% set instance view | instanceName %}
        {% if view.contentMode %}
        {{ instance }}.contentMode = .{{ view.contentMode }}
        {% endif %}
        {% if view.semanticContentAttribute %}
        {{ instance }}.semanticContentAttribute = .{{ view.semanticContentAttribute }}
        {% endif %}
        {% if view.tag %}
        {{ instance }}.tag = {{ view.tag }}
        {% endif %}
        {% if view.userInteractionEnabled %}
        {{ instance }}.isUserInteractionEnabled = {{ view.userInteractionEnabled | swiftBool }}
        {% endif %}
        {% if view.multipleTouchEnabled %}
        {{ instance }}.isMultipleTouchEnabled = {{ view.multipleTouchEnabled | swiftBool }}
        {% endif %}
        {% if view.alpha %}
        {{ instance }}.alpha = {{ view.alpha }}
        {% endif %}
        {% for color in view.color %}
        {% if color.red and color.green and color.blue and color.alpha %}
        {{ instance }}.{{ color.key }} = UIColor(red: {{color.red}}, green: {{color.green}}, blue: {{color.blue}}, alpha: {{color.alpha}})
        {% elif color.white and color.alpha %}
        {{ instance }}.{{ color.key }} = UIColor(white: {{color.white}}, alpha: {{color.alpha}})
        {% endif %}
        {% endfor %}
        {% if view.opaque %}
        {{ instance }}.isOpaque = {{ view.opaque | swiftBool }}
        {% endif %}
        {% if view.hidden %}
        {{ instance }}.isHidden = {{ view.hidden | swiftBool }}
        {% endif %}
        {% if view.clearsContextBeforeDrawing %}
        {{ instance }}.clearsContextBeforeDrawing = {{ view.clearsContextBeforeDrawing | swiftBool }}
        {% endif %}
        {% if view.clipsSubviews %}
        {{ instance }}.clipsToBounds = {{ view.clipsSubviews | swiftBool }}
        {% endif %}
        {% if view.autoresizesSubviews %}
        {{ instance }}.autoresizesSubviews = {{ view.autoresizesSubviews | swiftBool }}
        {% endif %}
        {% for rect in view.rect %}
        {{ instance }}.{{ rect.key }} = CGRect(x: {{ rect.x }}, y: {{ rect.y }}, width: {{ rect.width }}, height: {{ rect.height }})
        {% endfor %}
        {% if view.autoresizingMask | init %}
        {{ instance }}.autoresizingMask = {{ view.autoresizingMask | init }}
        {% endif %}
        {% if view.preservesSuperviewLayoutMargins %}
        {{ instance }}.preservesSuperviewLayoutMargins = {{ view.preservesSuperviewLayoutMargins | swiftBool }}
        {% endif %}
        {% if view.insetsLayoutMarginsFromSafeArea %}
        {{ instance }}.insetsLayoutMarginsFromSafeArea = {{ view.insetsLayoutMarginsFromSafeArea | swiftBool }}
        {% endif %}
        {% if view.contentHorizontalAlignment %}
        {{ instance }}.contentHorizontalAlignment = .{{ view.contentHorizontalAlignment }}
        {% endif %}
        {% if view.contentVerticalAlignment %}
        {{ instance }}.contentVerticalAlignment = .{{ view.contentVerticalAlignment }}
        {% endif %}
        {% if view.horizontalHuggingPriority %}
        {{ instance }}.setContentHuggingPriority(UILayoutPriority(rawValue: {{ view.horizontalHuggingPriority }}), for: .horizontal)
        {% endif %}
        {% if view.verticalHuggingPriority %}
        {{ instance }}.setContentHuggingPriority(UILayoutPriority(rawValue: {{ view.verticalHuggingPriority }}), for: .vertical)
        {% endif %}
        {% if view.horizontalCompressionResistancePriority %}
        {{ instance }}.setContentCompressionResistancePriority(UILayoutPriority(rawValue: {{ view.horizontalCompressionResistancePriority }}), for: .horizontal)
        {% endif %}
        {% if view.verticalCompressionResistancePriority %}
        {{ instance }}.setContentCompressionResistancePriority(UILayoutPriority(rawValue: {{ view.verticalCompressionResistancePriority }}), for: .vertical)
        {% endif %}
        {% if view.springLoaded %}
        {{ instance }}.isSpringLoaded = {{ view.springLoaded | swiftBool }}
        {% endif %}
        {% if view.selected %}
        {{ instance }}.isSelected = {{ view.selected | swiftBool }}
        {% endif %}
        {% if view.enabled %}
        {{ instance }}.isEnabled = {{ view.enabled | swiftBool }}
        {% endif %}
        {% if view.highlighted %}
        {{ instance }}.isHighlighted = {{ view.highlighted | swiftBool }}
        {% endif %}
        {% if view.translatesAutoresizingMaskIntoConstraints %}
        {{ instance }}.translatesAutoresizingMaskIntoConstraints = {{ view.translatesAutoresizingMaskIntoConstraints | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// ActivityIndicator
  ///
#}
{% macro render_activityindicatorview_properties view %}
        {% set instance view | instanceName %}
        {% if veiw.style %}
        {{ instance }}.style = .{{ view.style }}
        {% endif %}
        {% if view.animating %}
        {{ instance }}.isAnimating = {{ view.animating | swiftBool }}
        {% endif %}
        {% if view.hidesWhenStopped %}
        {{ instance }}.hidesWhenStopped = {{ view.hidesWhenStopped | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Button
  ///
#}
{% macro render_button_properties view %}
        {% set instance view | instanceName %}
        {% set titleLabelInstance %}{{ instance }}.titleLabel?{% endset %}
        {% if view.fontDescription %}
        {% call render_fontdescription titleLabelInstance view %}
        {% endif %}
        {% for state in view.state %}
        {% if state.title %}
        {{ instance }}.setTitle("{{ state.title }}", for: .{{ state.key }})
        {% endif %}
        {% if state.image %}
        {{ instance }}.setImage({% call render_image_or_nil state.image %}, for: .{{ state.key }})
        {% endif %}
        {% if state.backgroundImage %}
        {{ instance }}.setBackgroundImage({% call render_image_or_nil state.backgroundImage %}, compatibleWith: nil), for: .{{ state.key }})
        {% endif %}
        {% endfor %}
        {% if view.adjustsImageSizeForAccessibilityContentSizeCategory %}
        {{ instance }}.adjustsImageSizeForAccessibilityContentSizeCategory = {{ view.adjustsImageSizeForAccessibilityContentSizeCategory | swiftBool }}
        {% endif %}
        {% if view.reversesTitleShadowWhenHighlighted %}
        {{ instance }}.reversesTitleShadowWhenHighlighted = {{ view.reversesTitleShadowWhenHighlighted | swiftBool }}
        {% endif %}
        {% if view.showsTouchWhenHighlighted %}
        {{ instance }}.showsTouchWhenHighlighted = {{ view.showsTouchWhenHighlighted | swiftBool }}
        {% endif %}
        {% if view.adjustsImageWhenHighlighted %}
        {{ instance }}.adjustsImageWhenHighlighted = {{ view.adjustsImageWhenHighlighted | swiftBool }}
        {% endif %}
        {% if view.adjustsImageWhenDisabled %}
        {{ instance }}.adjustsImageWhenDisabled = {{ view.adjustsImageWhenDisabled | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// CollectionView
  ///
#}
{% macro render_collectionview_properties view %}
        {% set instance view | instanceName %}
        {% if view.prefetchingEnabled %}
        {{ instance }}.prefetchingEnabled = {{ view.prefetchingEnabled | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// DatePicker
  ///
#}
{% macro render_datepicker_properties view %}
        {% set instance view | instanceName %}
        {% if view.datePickerMode %}
        {{ instance }}.datePickerMode = .{{ view.datePickerMode }}
        {% endif %}
        {% if view.locale %}
        {{ instance }}.locale = Locale(identifier: "{{ view.locale.localeIdentifier }}")
        {% endif %}
        {% if view.minuteInterval %}
        {{ instance }}.minuteInterval = {{ view.minuteInterval }}
        {% endif %}
        {% for date in view.date %}
        {{ instance }}.{{ date.key }} = Date(timeIntervalSinceReferenceDate: {{ date.timeIntervalSinceReferenceDate }})
        {% endfor %}
        {% if view.countDownDuration %}
        {{ instance }}.countDownDuration  = {{ view.countDownDuration}}
        {% endif %}
{% endmacro %}
{#
  ///
  /// ImageView
  ///
#}
{% macro render_imageview_properties view %}
        {% set instance view | instanceName %}
        {% if view.image %}
        {{ instance }}.image = {% call render_image_or_nil view.image %}
        {% endif %}
        {% if view.highlightedImage %}
        {{ instance }}.highlightedImage = {% call render_image_or_nil view.highlightedImage %}
        {% endif %}
        {% if view.adjustsImageSizeForAccessibilityContentSizeCategory %}
        {{ instance }}.adjustsImageSizeForAccessibilityContentSizeCategory = {{ view.adjustsImageSizeForAccessibilityContentSizeCategory | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Label
  ///
#}
{% macro render_label_properties view %}
        {% set instance view | instanceName %}
        {% if view.text %}
        {{ instance }}.text = "{{ view.text }}"
        {% endif %}
        {% if view.attributedString %}
        {% call render_attributedString view %}
        {% endif %}
        {% if view.fontDescription %}
        {% call render_fontdescription instance view %}
        {% endif %}
        {% if view.textAlignment %}
        {{ instance }}.textAlignment = .{{ view.textAlignment }}
        {% endif %}
        {% if view.numberOfLines %}
        {{ instance }}.numberOfLines = {{ view.numberOfLines }}
        {% endif %}
        {% if view.baselineAdjustment %}
        {{ instance }}.baselineAdjustment = .{{ view.baselineAdjustment }}
        {% endif %}
        {% if view.lineBreakMode == "clip" %}
        {{ instance }}.lineBreakMode = .byClipping
        {% elif view.lineBreakMode == "characterWrap" %}
        {{ instance }}.lineBreakMode = .byCharWrapping
        {% elif view.lineBreakMode == "wordWrap" %}
        {{ instance }}.lineBreakMode = .byWordWrapping
        {% elif view.lineBreakMode == "headTruncation" %}
        {{ instance }}.lineBreakMode = .byTruncatingHead
        {% elif view.lineBreakMode == "middleTruncation" %}
        {{ instance }}.lineBreakMode = .byTruncatingMiddle
        {% elif view.lineBreakMode == "tailTruncation" %}
        {{ instance }}.lineBreakMode = .byTruncatingTail
        {% endif %}
        {% if view.adjustsFontSizeToFit %}
        {{ instance }}.adjustsFontSizeToFitWidth = {{ view.adjustsFontSizeToFit | swiftBool }}
        {% endif %}
        {% if view.adjustsLetterSpacingToFitWidth %}
        {{ instance }}.adjustsLetterSpacingToFitWidth = {{ view.adjustsLetterSpacingToFitWidth | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// MapView
  ///
#}
{% macro render_mapview_properties view %}
        {% set instance view | instanceName %}
        {% if view.mapType %}
        {{ instance }}.mapType = .{{ view.mapType }}
        {% endif %}
        {% if view.zoomEnabled %}
        {{ instance }}.isZoomEnabled = {{ view.zoomEnabled | swiftBool }}
        {% endif %}
        {% if view.scrollEnabled %}
        {{ instance }}.isScrollEnabled = {{ view.scrollEnabled | swiftBool }}
        {% endif %}
        {% if view.rotateEnabled %}
        {{ instance }}.isRotateEnabled = {{ view.rotateEnabled | swiftBool }}
        {% endif %}
        {% if view.pitchEnabled %}
        {{ instance }}.isPitchEnabled = {{ view.pitchEnabled | swiftBool }}
        {% endif %}
        {% if view.showsBuildings %}
        {{ instance }}.showsBuildings = {{ view.showsBuildings | swiftBool }}
        {% endif %}
        {% if view.showsCompass %}
        {{ instance }}.showsCompass = {{ view.showsCompass | swiftBool }}
        {% endif %}
        {% if view.showsScale %}
        {{ instance }}.showsScale = {{ view.showsScale | swiftBool }}
        {% endif %}
        {% if veiw.showsTraffic %}
        {{ instance }}.showsTraffic = {{ view.showsTraffic | swiftBool }}
        {% endif %}
        {% if view.showsPointsOfInterest %}
        {{ instance }}.showsPointsOfInterest = {{ view.showsPointsOfInterest | swiftBool }}
        {% endif %}
        {% if view.showsUserLocation %}
        {{ instance }}.showsUserLocation = {{ view.showsUserLocation | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// NavigationBar
  ///
#}
{% macro render_navigationbar_properties view %}
        {% set instance view | instanceName %}
        {% if view.barStyle %}
        {{ instance }}.barStyle = .{{ view.barStyle }}
        {% endif %}
        {% if view.translucent %}
        {{ instance }}.isTranslucent = {{ view.translucent | swiftBool }}
        {% endif %}
        {% if view.largeTitles %}
        {{ instance }}.prefersLargeTitles = {{ view.largeTitles | swiftBool}}
        {% endif %}
        {% if view.shadowImage %}
        {{ instance }}.shadowImage = {% call render_image_or_nil view.shadowImage %}
        {% endif %}
        {% if view.backIndicatorImage %}
        {{ instance}}.backIndicatorImage = {% call render_image_or_nil view.backIndicatorImage %}
        {% endif %}
        {% if view.backIndicatorTransitionMaskImage %}
        {{ instance }}.backIndicatorTransitionMaskImage = {% call render_image_or_nil view.backIndicatorTransitionMaskImage %}
        {% endif %}
        {% for item in view.items %}
        {% set itemInstance item | instanceName %}
        let {{ itemInstance }} = UINavigationItem(title: "{{ item.title }}")
        {% if item.prompt %}
        {{ itemInstance }}.prompt = "{{ item.prompt }}"
        {% endif %}
        {% if item.largeTitleDisplayMode %}
        {{ itemInstance }}.largeTitleDisplayMode = .{{ item.largeTitleDisplayMode }}
        {% endif %}
        {% if item.leftBarButtonItems %}
        {{ itemInstance }}.leftBarButtonItems [
                {% for buttonItem in view.leftBarButtonItems %}
                UIBarButtonItem(title: "{{ buttonItem.title }}", style: .plain, target: nil, action: nil)
                {% endfor %}
        ]
        {% endif %}
        {% if item.rightBarButtonItems %}
        {{ itemInstance }}.rightBarButtons = [
                {% for buttonItem in view.rightBarButtonItems %}
                UIBarButtonItem(title: "{{ buttonItem.title }}", style: .plain, target: nil, action: nil)
                {% endfor %}
        ]
        {% endif %}
        {% for buttonItem in item.barButtonItem %}
        {{ itemInstance }}.{{ buttonItem.key }} = {% call render_barbuttonitem buttonItem %}
        {% endfor %}
        {{ instance }}.items = [{{ itemInstance }}]
        {% endfor %}
{% endmacro %}
{#
  ///
  /// BarButtonItem
  ///
#}
{% macro render_barbuttonitem item %}{% if item.systemItem %}UIBarButtonItem(barButtonSystemItem: .{{ item.systemItem }}, target: nil, action: nil){% else %}UIBarButtonItem(title: "{{ item.title }}", style: .plain, target: nil, action: nil){% endif %}{% endmacro %}
{#
  ///
  /// PageControl
  ///
#}
{% macro render_pagecontrol_properties view %}
        {% set instance view | instanceName %}
        {% if view.numberOfPages %}
        {{ instance }}.numberOfPages = {{ view.numberOfPages }}
        {% endif %}
        {% if view.currentPage %}
        {{ instance }}.currentPage = {{ view.currentPage }}
        {% endif %}
        {% if view.hidesForSinglePage %}
        {{ instance }}.hidesForSinglePage = {{ view.hidesForSinglePage | swiftBool }}
        {% endif %}
        {% if view.defersCurrentPageDisplay %}
        {{ instance }}.defersCurrentPageDisplay = {{ view.defersCurrentPageDisplay | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// PickerView
  ///
#}
{% macro render_pickerview_properties view %}
        {% set instance view | instanceName %}
{% endmacro %}
{#
  ///
  /// ProgressView
  ///
#}
{% macro render_progressview_properties view %}
        {% set instance view | instanceName %}
        {% if view.progress %}
        {{ instance }}.progress = {{ view.progress }}
        {% endif %}
        {% if view.progressImage %}
        {{ instance }}.progressImage = {% call render_image_or_nil view.progressImage %}
        {% endif %}
        {% if view.trackImage %}
        {{ instance }}.trackImage = {% call render_image_or_nil view.trackImage %}
        {% endif %}
{% endmacro %}
{#
  ///
  /// ScrollView
  ///
#}
{% macro render_scrollview_properties view %}
        {% set instance view | instanceName %}
        {% if view.indicatorStyle %}
        {{ instance }}.indicatorStyle = .{{ view.indicatorStyle }}
        {% endif %}
        {% if view.showsHorizontalScrollIndicator %}
        {{ instance }}.showsHorizontalScrollIndicator = {{ view.showsHorizontalScrollIndicator | swiftBool }}
        {% endif %}
        {% if view.showsVerticalScrollIndicator %}
        {{ instance }}.showsVerticalScrollIndicator = {{ view.showsVerticalScrollIndicator | swiftBool }}
        {% endif %}
        {% if view.scrollEnabled %}
        {{ instance }}.isScrollEnabled = {{ view.scrollEnabled | swiftBool }}
        {% endif %}
        {% if view.pagingEnabled %}
        {{ instance }}.isPagingEnabled = {{ view.pagingEnabled | swiftBool }}
        {% endif %}
        {% if view.directionalLockEnabled %}
        {{ instance }}.isDirectionalLockEnabled = {{ view.directionalLockEnabled | swiftBool }}
        {% endif %}
        {% if view.bounces %}
        {{ instance }}.bounces = {{ view.bounces | swiftBool }}
        {% endif %}
        {% if view.alwaysBounceVertical %}
        {{ instance }}.alwaysBounceVertical = {{ view.alwaysBounceVertical | swiftBool}}
        {% endif %}
        {% if view.alwaysBounceHorizontal %}
        {{ instance }}.alwaysBounceHorizontal = {{ view.alwaysBounceHorizontal | swiftBool}} 
        {% endif %}
        {% if view.bouncesZoom %}
        {{ instance }}.bouncesZoom = {{ view.bouncesZoom | swiftBool }}
        {% endif %}
        {% if view.minimumZoomScale %}
        {{ instance }}.minimumZoomScale = {{ view.minimumZoomScale }}
        {% endif %}
        {% if view.maximumZoomScale %}
        {{ instance }}.maximumZoomScale = {{ view.maximumZoomScale }}
        {% endif %}
        {% if view.delaysContentTouches %}
        {{ instance }}.delaysContentTouches = {{ view.delaysContentTouches | swiftBool}}
        {% endif %}
        {% if view.canCancelContentTouches %}
        {{ instance }}.canCancelContentTouches = {{ view.canCancelContentTouches | swiftBool}}
        {% endif %}
        {% if view.keyboardDismissMode %}
        {{ instance }}.keyboardDismissMode = .{{ view.keyboardDismissMode }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Searchbar
  ///
#}
{% macro render_searchbar_properties view %}
        {% set instance view | instanceName %}
        {% if view.text %}
        {{ instance }}.text = {{ view.text }}
        {% endif %}
        {% if view.placeholder %}
        {{ instance }}.placeholder = {{ view.placeholder }}
        {% endif %}
        {% if view.prompt %}
        {{ innstance }}.prompt = {{ view.prompt }}
        {% endif %}
        {% if view.searchBarStyle %}
        {{ instance }}.searchBarStyle = .{{ view.searchBarStyle }}
        {% endif %}
        {% if view.barStyle %}
        {{ instance }}.barStyle = .{{ view.barStyle }}
        {% endif %}
        {% if view.translucent %}
        {{ instance }}.isTranslucent = {{ view.translucent | swiftBool }}
        {% endif %}
        {% if view.backgroundImage %}
        {{ instance }}.setBackgroundImage({% call render_image_or_nil view.backgroundImage %}, for: .any, barMetrics: .default)
        {% endif %}
        {% if view.scopeBarBackgroundImage %}
        {{ instance }}.setScopeBarButtonBackgroundImage({% call render_image_or_nil view.scopeBarBackgroundImage %}, for: .any)
        {% endif %}
        {% for offsetWrapper in view.offsetWrapper %}
        {{ instance }}.{{ offsetWrapper.key }} = UIOffset(horizontal: {{ offsetWrapper.horizontal }}, vertical: {{ offsetWrapper.vertical }})
        {% endfor %}
        {% if view.showsSearchResultsButton %}
        {{ instance }}.showsSearchResultsButton = {{ view.showsSearchResultsButton | swiftBool }}
        {% endif %}
        {% if view.showsBookmarkButton %}
        {{ instance }}.showsBookmarkButton = {{ view.showsBookmarkButton | swiftBool }}
        {% endif %}
        {% if view.showsCancelButton %}
        {{ instance }}.showsCancelButton = {{ view.showsCancelButton | swiftBool }}
        {% endif %}
        {% if view.scopeButtonTitles %}
        {{ instance }}.scopeButtonTitles = [
            {% for scopeButtonTitle in view.scopeButtonTitles %}
            "{{ scopeButtonTitle }}"
            {% endfor %}
        ]
        {% endif %}
{% endmacro %}
{#
  ///
  /// SegmentedControl
  ///
#}
{% macro render_segmentedcontrol_properties view %}
        {% set instance view | instanceName %}
        {% if view.momentary %}
        {{ instance }}.isMomentary = {{ view.momentary | swiftBool }}
        {% endif %}
        {% if view.selectedSegmentIndex %}
        {{ instance }}.selectedSegmentIndex = {{ view.selectedSegmentIndex }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Slider
  ///
#}
{% macro render_slider_properties view %}
        {% set instance view | instanceName %}
        {% if view.value %}
        {{ instance }}.value = {{ view.value }}
        {% endif %}
        {% if view.minValue %}
        {{ instance }}.minimumValue = {{ view.minValue }}
        {% endif %}
        {% if view.maxValue %}
        {{ instance }}.maximumValue = {{ view.maxValue }}
        {% endif %}
        {% if view.minimumValueImage %}
        {{ instance }}.minimumValueImage = {% call render_image_or_nil view.minimumValueImage %}
        {% endif %}
        {% if view.maximumValueImage %}
        {{ instance }}.maximumValueImage = {% call render_image_or_nil view.maximumValueImage %}
        {% endif %}
        {% if view.continuous %}
        {{ instance }}.isContinuous = {{ view.continuous | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// StackView
  ///
#}
{% macro render_stackview_properties view %}
        {% set instance view | instanceName %}
        {% if view.axis %}
        {{ instance }}.axis = .{{ view.axis }}
        {% endif %}
        {% if view.alignment %}
        {{ instance }}.alignment = .{{ view.alignment }}
        {% endif %}
        {% if view.distribution %}
        {{ instance }}.distribution = .{{ view.distribution }}
        {% endif %}
        {% if view.spacing %}
        {{ instance }}.spacing = {{ view.spacing }}
        {% endif %}
        {% if view.baselineRelativeArrangement %}
        {{ instance }}.isBaselineRelativeArrangement = {{ view.baselineRelativeArrangement | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Stepper
  ///
#}
{% macro render_stepper_properties view %}
        {% set instance view | instanceName %}
        {% if view.value %}
        {{ instance }}.value = {{ view.value }}
        {% endif %}
        {% if view.minimumValue %}
        {{ instance }}.minimumValue = {{ view.minimumValue }}
        {% endif %}
        {% if view.maximumValue %}
        {{ instance }}.maximumValue = {{ view.maximumValue }}
        {% endif %}
        {% if view.stepValue %}
        {{ instance }}.stepValue = {{ view.stepValue }}
        {% endif %}
        {% if view.autorepeat %}
        {{ instance }}.autorepeat = {{ view.autorepeat | swiftBool }}
        {% endif %}
        {% if view.continuous %}
        {{ instance }}.isContinuous = {{ view.continuous | swiftBool }}
        {% endif %}
        {% if view.wraps %}
        {{ instance }}.wraps = {{ view.wraps | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Switch
  ///
#}
{% macro render_switch_properties view %}
        {% set instance view | instanceName %}
        {% if view.on %}
        {{ instance }}.isOn = {{ view.on | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Tabbar
  ///
#}
{% macro render_tabbar_properties view %}
        {% set instance view | instanceName %}
        {% if view.backgroundImage %}
        {{ instance }}.backgroundImage = {% call render_image_or_nil view.backgroundImage %}
        {% endif %}
        {% if view.shadowImage %}
        {{ instance }}.shadowImage = {% call render_image_or_nil view.shadowImage %}
        {% endif %}
        {% if view.selectionIndicatorImage %}
        {{ instance }}.selectionIndicatorImage = {% call render_image_or_nil view.selectionIndicatorImage %}
        {% endif %}
        {% if view.barStyle %}
        {{ instance }}.barStyle = .{{ view.barStyle }}
        {% endif %}
        {% if view.translucent %}
        {{ instance }}.isTranslucent = {{ view.translucent | swiftBool }}
        {% endif %}
        {% if view.itemPositioning %}
        {{ instance }}.itemPositioning = .{{ view.itemPositioning }}
        {% endif %}
        {% if view.items %}
        {{ instance }}.items = [
            {% for item in view.items %}
            {% if item.systemItem %}
            UITabBarItem(tabBarSystemItem: .{{ item.systemItem }}, tag: 0),
            {% else %}
            UITabBarItem(title: "{{ item.title | default:"" }}", image: {% call render_image_or_nil item.image %}, selectedImage: {% call render_image_or_nil item.selectedImage %}),
            {% endif %}
            {% endfor %}
        ]
        {% endif %}
{% endmacro %}
{#
  ///
  /// TableView
  ///
#}
{% macro render_tableview_properties view %}
        {% set instance view | instanceName %}
        {% if view.separatorStyle %}
        {{ instance }}.separatorStyle  = .{{ view.separatorStyle }}
        {% endif %}
        {% if view.allowsSelection %}
        {{ instance }}.allowsSelection = {{ view.allowsSelection | swiftBool }}
        {% endif %}
        {% if view.allowsMultipleSelection %}
        {{ instance }}.allowsMultipleSelection = {{ view.allowsMultipleSelection | swiftBool }}
        {% endif %}
        {% if view.allowsSelectionDuringEditing %}
        {{ instance }}.allowsSelectionDuringEditing = {{ view.allowsSelectionDuringEditing | swiftBool }}
        {% endif %}
        {% if view.allowsMultipleSelectionDuringEditing %}
        {{ instance }}.allowsMultipleSelectionDuringEditing = {{ view.allowsMultipleSelectionDuringEditing | swiftBool}}
        {% endif %}
        {% if view.sectionIndexMinimumDisplayRowCount %}
        {{ instance }}.sectionIndexMinimumDisplayRowCount = {{ view.sectionIndexMinimumDisplayRowCount }}
        {% endif %}
        {% if view.rowHeight %}
        {{ instance }}.rowHeight = {{ view.rowHeight }}
        {% endif %}
        {% if view.estimatedRowHeight %}
        {{ instance }}.estimatedRowHeight = {{ view.estimatedRowHeight }}
        {% endif %}
        {% if view.sectionHeaderHeight %}
        {{ instance }}.sectionHeaderHeight = {{ view.sectionHeaderHeight }}
        {% endif %}
        {% if view.estimatedSectionHeaderHeight %}
        {{ instance }}.estimatedSectionHeaderHeight = {{ view.estimatedSectionHeaderHeight }}
        {% endif %}
        {% if view.sectionFooterHeight %}
        {{ instance }}.sectionFooterHeight = {{ view.sectionFooterHeight }}
        {% endif %}
        {% if view.estimatedSectionFooterHeight %}
        {{ instance }}.estimatedSectionFooterHeight = {{ view.estimatedSectionFooterHeight }}
        {% endif %}
        {% if view.contentViewInsetsToSafeArea %}
        {{ instance }}.insetsContentViewsToSafeArea = {{ view.contentViewInsetsToSafeArea | swiftBool}}
        {% endif %}
{% endmacro %}
{#
  ///
  /// TextField
  ///
#}
{% macro render_textfield_properties view %}
        {% set instance view | instanceName %}
        {% if view.text %}
        {{ instance }}.text = "{{ view.text }}"
        {% endif %}
        {% if view.attributedString %}
        {% call render_attributedString view %}
        {% endif %}
        {% if view.fontDescription %}
        {% call render_fontdescription instance view %}
        {% endif %}
        {% if view.adjustsFontForContentSizeCategory %}
        {{ instance }}.adjustsFontForContentSizeCategory = {{ view.adjustsFontForContentSizeCategory | swiftBool }}
        {% endif %}
        {% if view.placeholder %}
        {{ instance }}.placeholder = "{{ view.placeholder }}"
        {% endif %}        
        {% if view.background %}
        {{ instance }}.background = {% call render_image_or_nil view.background %}
        {% endif %}
        {% if view.disabledBackground %}
        {{ instance }}.disabledBackground = {% call render_image_or_nil view.disabledBackground %}
        {% endif %}
        {% if view.borderStyle %}
        {{ instance }}.borderStyle = .{{ view.borderStyle }}
        {% endif %}
        {% if view.clearButtonMode %}
        {{ instance }}.clearButtonMode = .{{ view.clearButtonMode }}
        {% endif %}
        {% if view.minimumFontSize %}
        {{ instance }}.minimumFontSize = {{ view.minimumFontSize }}
        {% endif %}
        {% if view.adjustsFontSizeToFit %}
        {{ instance }}.adjustsFontSizeToFitWidth = {{ view.adjustsFontSizeToFit | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// TextView
  ///
#}
{% macro render_textview_properties view %}
        {% set instance view | instanceName %}
        {% if view.string %}
        {{ instance }}.text = "{{ view.string }}"
        {% endif %}
        {% if view.attributedString %}
        {% call render_attributedString view %}
        {% endif %}
        {% if view.fontDescription %}
        {% call render_fontdescription instance view %}
        {% endif %}
        {% if view.adjustsFontForContentSizeCategory %}
        {{ instance }}.adjustsFontForContentSizeCategory = {{ view.adjustsFontForContentSizeCategory | swiftBool }}
        {% endif %}
        {% if view.textAlignment %}
        {{ instance }}.textAlignment = .{{ view.textAlignment }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Toolbar
  ///
#}
{% macro render_toolbar_properties view %}
        {% set instance view | instanceName %}
        {% if view.barStyle %}
        {{ instance }}.barStyle = .{{ view.barStyle }}
        {% endif %}
        {% if view.translucent %}
        {{ instance }}.isTranslucent = {{ view.translucent | swiftBool }}
        {% endif %}
        {% if view.items %}
        {{ instance }}.items = [
            {% for item in view.items %}
            {% if item.systemItem %}
            UIBarButtonItem(barButtonSystemItem: .{{ item.systemItem }}, target: nil, action: nil),
            {% elif item.image %}
            UIBarButtonItem(image: {% call render_image_or_nil item.image %}, style: .plain, target: nil, action: nil),
            {% else %}
            UIBarButtonItem(title: "{{ item.title | default:"" }}", style: .plain, target: nil, action: nil),
            {% endif %}
            {% endfor %}
        ]
        {% endif %}
{% endmacro %}
{#
  ///
  /// WKWebView
  ///
#}
{% macro render_wkwebview_properties view %}
        {% set instance view | instanceName %}
        {% if view.customUserAgent %}
        {{ instance }}.customUserAgent = {{ view.customUserAgent }}
        {% endif %}
        {% if view.allowsBackForwardNavigationGestures %}
        {{ instance }}.allowsBackForwardNavigationGestures = {{ view.allowsBackForwardNavigationGestures | swiftBool}}
        {% endif %}
        {% if view.allowsLinkPreview %}
        {{ instance }}.allowsLinkPreview = {{ view.allowsLinkPreview | swiftBool }}
        {% endif %}
{% endmacro %}
{#
  ///
  /// Subviews
  ///
#}
{% macro render_subviews view %}
        {% set instance view | instanceName %}
        {% set instanceType view | type %}
        {% set instance_prefix %}let {% endset %%}
        {% for view in view.subviews %}
        {% set sub_instance view | instanceName %}
        {% set type view | type %}

        /* {{ view.id }} */
        {% if type == "TableView" %}
        {% if view.style %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero, style: {{ view.style }})
        {% else %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero)
        {% endif %}
        {% elif type == "Button" %}
        {% if view.buttonType %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(type: .{{ view.buttonType }})
        {% else %}
        let {{ sub_instance }} = {{ view | class }}(frame: .zero)
        {% endif %}
        {% elif type == "ProgressView" %}
        {% if view.progressViewStyle %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(progressViewStyle: .{{ view.progressViewStyle }})
        {% else %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero)
        {% endif %}
        {% elif type == "SegmentedControl" %}
        {% if view.segments %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(items: [
            {% for segment in view.segments %}
            "{{ segment.title }}",
            {% endfor %}
        ])
        {% elif type == "TableView" %}
        {% if view.style %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero, style: {{ view.style }})
        {% else %}
        {% endif %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero)
        {% else %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero)
        {% endif %}
        {% else %}
        {{ instance_prefix }}{{ sub_instance }} = {{ view | class }}(frame: .zero)
        {% endif %}
        {% call render_view view %}
        {% if instanceType == "StackView" %}
        {{ instance }}.addArrangedSubview({{ sub_instance }})
        {% else %}
        {{ instance }}.addSubview({{ sub_instance }})
        {% endif %}
        {% endfor %}
{% endmacro %}
{#
  ///
  /// Attributed Strings
  ///
#}
{% macro render_attributedString view %}
        {% set instance view | instanceName %}
        {{ instance }}.{{ view.attributedString.key }} = NSAttributedString(string: "{% call render_attributedString_content view %}", 
                      attributes: [
                                    {% if view.attributedString.fragment.attributes.font %} 
                                    {% if view.attributedString.fragment.attributes.font.metaFont == "smallSystem" %}
                                    .font: UIFont.systemFont(ofSize: 11), 
                                    {% elif view.attributedString.fragment.attributes.font.metaFont == "system" %}
                                    .font: UIFont.systemFont(ofSize: {{ view.attributedString.fragment.attributes.font.size }}), 
                                    {% else %}
                                    .font: UIFont(name: "{{ view.attributedString.fragment.attributes.font.name }}", size: {{ view.attributedString.fragment.attributes.font.size }}), 
                                    {% endif %}
                                    {% endif %}
                                  ])
{% endmacro %}
{#
  ///
  /// Attributed String Content
  ///
#}
{% macro render_attributedString_content view %}{% if view.attributedString.fragment.string %}{{ view.attributedString.fragment.string }}{% else %}{{ view.attributedString.fragment.content }}{% endif %}{% endmacro  %}
{#
  ///
  /// FontDescription
  ///
#}
{% macro render_fontdescription instance view %}
        {% if view.fontDescription.type == "system" and view.fontDescription.weight %}
        {{ instance }}.font = UIFont.systemFont(ofSize: {{ view.fontDescription.pointSize }}, weight: .{{ view.fontDescription.weight }})
        {% elif view.fontDescription.type == "system" %}
        {{ instance }}.font = UIFont.systemFont(ofSize: {{ view.fontDescription.pointSize }})
        {% elif view.fontDescription.type == "boldSystem" %}
        {{ instance }}.font = UIFont.boldSystemFont(ofSize: {{ view.fontDescription.pointSize }})
        {% elif view.fontDescription.type == "italicSystem" %}
        {{ instance }}.font = UIFont.italicSystemFont(ofSize: {{ view.fontDescription.pointSize }})
        {% elif view.fontDescription.type == "UICTFontTextStyleBody" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .body)
        {% elif view.fontDescription.type == "UICTFontTextStyleCallout" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .callout)
        {% elif view.fontDescription.type == "UICTFontTextStyleCaption1" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .caption1)
        {% elif view.fontDescription.type == "UICTFontTextStyleCaption2" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .caption2)
        {% elif view.fontDescription.type == "UICTFontTextStyleFootnote" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .footnote)
        {% elif view.fontDescription.type == "UICTFontTextStyleHeadline" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .headline)
        {% elif view.fontDescription.type == "UICTFontTextStyleSubhead" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .subheadline)
        {% elif view.fontDescription.type == "UICTFontTextStyleTitle0" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        {% elif view.fontDescription.type == "UICTFontTextStyleTitle1" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .title1)
        {% elif view.fontDescription.type == "UICTFontTextStyleTitle2" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .title2)
        {% elif view.fontDescription.type == "UICTFontTextStyleTitle3" %}
        {{ instance }}.font = UIFont.preferredFont(forTextStyle: .title3)
        {% else %}
        {{ instance }}.font = UIFont(name: "{{ view.fontDescription.name }}", size: {{ view.fontDescription.pointSize }})
        {% endif %}
{% endmacro %}
{#
  ///
  /// Image or nil
  ///
#}
{% macro render_image_or_nil image %}{% if image %}UIImage(named: "{{ image }}", in: Bundle(for: {{ viewController | instanceName }}.self), compatibleWith: nil){% else %}nil{% endif %}{% endmacro %}
{#
  ///
  /// GestureRecognizers
  ///
#}
{% macro render_gesturerecognizers scene %}
        {% for tapGestureRecognizer in scene.tapGestureRecognizer %}
        {% set instance tapGestureRecognizer | instanceName %}
        {% for connection in tapGestureRecognizer.connections %}
        let {{ instance }} = UITapGestureRecognizer(target: self, action: Selector("{{ connection.selector }}"))
        {% endfor %}
        {% endfor %}
{% endmacro %}
{#
  ///
  /// View constraints
  ///
#}
{% macro render_constraints view %}
        {% set instance view | instanceName %}
        {% for constraint in view.constraints %}
        /* {{ constraint.id }} */
        {% set constraintInstance constraint | instanceName %}
        let {{ constraintInstance }} = NSLayoutConstraint(item: {% call constraint_item constraint.firstItem instance %}, attribute: .{{ constraint.firstAttribute|default:"notAnAttribute" }}, relatedBy: .{{ constraint.relation|default:"equal" }}, toItem: {% call constraint_item constraint.secondItem "nil" %}, attribute: .{{ constraint.secondAttribute|default:"notAnAttribute" }}, multiplier: {{ constraint.multiplier | swiftMultiplier }}, constant: {{ constraint.constant|default:"0" }})
        {% if constraint.priority %}
        {{ constraintInstance }}.priority = UILayoutPriority(rawValue: {{ constraint.priority }})
        {% endif %}
        {{ instance }}.addConstraint({{ constraintInstance }})
        {% endfor %}
        {% call render_subviews_constraints view %}
{% endmacro %}
{#
  ///
  /// Subview constraints
  ///
#}
{% macro render_subviews_constraints view %}
        {% for view in view.subviews %}
        {% call render_constraints view %}
        {% endfor %}
{% endmacro %}
{#
  ///
  /// Constarint item
  ///
#}
{% macro constraint_item id instance %}{% if id %}{{ id | instanceName }}{% else %}{{ instance }}{% endif %}{% endmacro %}
{#
  ///
  /// ViewController connections
  ///
#}
{% macro render_viewcontroller_connections viewController %}
        {% for property in viewController | outletcollection_properties %}
        self.{{ property }} = []
        {% endfor %}
        {% for connection in viewController.connections %}
        {% set type connection | type %}
        {% if type == "Outlet" %}
        self.{{ connection.property }} = {{ connection.destination | instanceName }}
        {% elif type == "OutletCollection" %}
        self.{{ connection.property }}.append({{ connection.destination | instanceName }})
        {% endif %}
        {% endfor %}
{% endmacro %}
{#
  ///
  /// View connections
  ///
#}
{% macro render_connections view %}
        {% set instance view | instanceName %}
        {% for property in view | outletcollection_properties %}
        {{ instance }}.{{ property }} = []
        {% endfor %}
        {% for connection in view.connections %}
        {% set type connection | type %}
        {% if type == "Outlet" %}
        {{ instance }}.{{ connection.property }} = {{ connection.destination | instanceName }}
        {% elif type == "OutletCollection" %}
        {% if connection.property == "gestureRecognizers" %}
        {{ instance }}.addGestureRecognizer({{ connection.destination | instanceName }})
        {% else %}
        {{ instance }}.{{ connection.property }}.append({{ connection.destination | instanceName }})
        {% endif %}
        {% endif %}
        {% endfor %}
        {% call render_subviews_connections view %}
{% endmacro %}
{#
  ///
  /// Subview connections
  ///
#}
{% macro render_subviews_connections view %}
        {% for view in view.subviews %}
        {% call render_connections view %}
        {% endfor %}
{% endmacro %}
{#
  ///
  /// View actions
  ///
#}
{% macro render_actions view %}
        {% set instance view | instanceName %}
        {% for connection in view.connections %}
        {% set type connection | type %}
        {% if type == "Action" %}
        {{ instance }}.addTarget(self, action: Selector("{{ connection.selector }}"), for: .{{ connection.eventType }})
        {% endif %}
        {% endfor %}
{% endmacro %}
{#

   _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                  Main
   _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

 #}
{% for scene in document.scenes %}
{% set viewController scene.viewController %}
{{ viewController | framework_references }}
{{ viewController | reset_state }}

{% if codegen == "class" %}
class {{ viewController | instanceName }}: {{ viewController | class }} {

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        loadLayouts()
    }
{% else %}
extension {{ viewController | instanceName }} {
{% endif %}

    // 
    // Auto-Generated by storyboard2code (https://github.com/watanabetoshinori/storyboard2code)
    // 

    func loadLayouts() {
        {% call render_vc viewController %}

        {% for view in viewController | rootViews %}
        {% call render_view view %}
        {% endfor %}
        {% call render_gesturerecognizers scene %}

        {% for view in viewController | rootViews %}
        {% call render_constraints view %}
        {% endfor %}

        {% call render_viewcontroller_connections viewController %}
        {% for view in viewController | rootViews %}
        {% call render_connections view %}
        {% endfor %}
    }

}

{% endfor %}
"""
