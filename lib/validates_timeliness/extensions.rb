module ValidatesTimeliness
  module Extensions
    autoload :DateTimeSelect,        'validates_timeliness/extensions/date_time_select'
    autoload :MultiparameterHandler, 'validates_timeliness/extensions/multiparameter_handler'
  end

  def self.enable_date_time_select_extension!

    if ActiveRecord::VERSION::MAJOR < 4
      ::ActionView::Helpers::InstanceTag.send(:include, ValidatesTimeliness::Extensions::DateTimeSelect)
    else
      ::ActionView::Helpers::Tags::DateSelect.send(:include, ValidatesTimeliness::Extensions::DateTimeSelect)
    end
  end

  def self.enable_multiparameter_extension!
    ::ActiveRecord::Base.send(:include, ValidatesTimeliness::Extensions::MultiparameterHandler)
  end
end
