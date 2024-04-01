module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: 'max-w-sm w-full shadow-lg rounded px-4 py-3 relative pointer-events-auto bg-green-400 border-l-4 border-green-700 text-white',
      error: ' max-w-sm w-full shadow-lg rounded px-4 py-3 relative pointer-events-auto bg-red-400 border-l-4 border-red-700 text-black'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
