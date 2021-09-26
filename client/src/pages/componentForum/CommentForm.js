import React,{useState} from 'react'

const CommentForm = ({ 
    handleSubmit,
    submitLabel,
    hasCancelButton = false,
    handleCancel,
    initialText = "",
    })=>{
        const [text, setText] = useState(initialText);
        const isTextareaDisabled = text.length === 0;
        const onSubmit = (event) => {
          event.preventDefault();
          handleSubmit(text);
          setText("");
        };

    return (
        <form onSubmit={onSubmit}>
            <div className="mb-6 flex flex-col w-full">
                <textarea className="commient-form-textaera resize-none w-full bg-gray-500 h-32 my-4 mx-5 rounded-lg focus:ring-4 focus:ring-orange-500 focus:outline-none text-white focus:shadow-2xl" 
                value={text}
                onChange={(e) => setText(e.target.value)}
                />
                <div className="flex justify-end">
                    <button className="comment-form-button w-24 h-12 rounded-lg flex justify-center items-center text-white bg-orange-600 disabled:opacity-30 " 
                    disabled ={isTextareaDisabled}>
                    {submitLabel}</button>
                </div>
            </div>
            {hasCancelButton && (
                <button 
                    type="button" 
                    className="comment-form-button"
                    onClick={handleCancel}
                >
                    Cancel
                </button>
            )}
        </form>
    )
}

export default CommentForm