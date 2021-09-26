import React from 'react'
import CommentForm from './CommentForm';
// import icon from '../../images/user-icon.png'

const Comment = ({
    comment,
    replies,
    setActiveComment,
    activeComment,
    updateComment,
    deleteComment,
    addComment,
    parentId = null,
    currentUserId,
})=>{
    const isEditing =
    activeComment &&
    activeComment.id === comment.id &&
    activeComment.type === "editing";
  const isReplying =
    activeComment &&
    activeComment.id === comment.id &&
    activeComment.type === "replying";
  const fiveMinutes = 300000;
  const timePassed = new Date() - new Date(comment.createdAt) > fiveMinutes;
  const canDelete =
    currentUserId === comment.userId && replies.length === 0 && !timePassed;
  const canReply = Boolean(currentUserId);
  const canEdit = currentUserId === comment.userId && !timePassed;
  const replyId = parentId ? parentId : comment.id;
  const createdAt = new Date(comment.createdAt).toLocaleDateString();    
  return (
        <div className="mb-10">
        <div className="flex justify-between mb-4">
            <div className="w-1/6 whitespace-nowrap flex mr-28">
                <div className="flex-shrink-0 h-10 w-10 mx-6 my-auto">
                    <img className="h-10 w-10 rounded-full" src= {comment.image} alt="" />
                </div>
                <div className="flex items-center">
                    <div className="">
                        <div className="">{comment.userName}</div>
                        <div className="text-xs">{createdAt}</div>
                    </div>
                </div>
            </div>
            <div className="px-6 w-5/6 whitespace-nowrap">
                {!isEditing && <div className="">{comment.comment}</div>}
                {isEditing && (
                    <CommentForm 
                    submitLabel="Update"
                    hasCancelButton
                    initialText={comment.body}
                    handleSubmit={(text) => updateComment(text, comment.id)}
                    handleCancel={() => {
                      setActiveComment(null);
                    }}
                    />
                )}
                <div className="mt-2 w-36 comment-actions flex text-xs flex justify-between">
                    {canReply && (
                        <div 
                    className="comment-action" 
                    onClick={()=> 
                        setActiveComment({ id: comment.id, type: "replying" })
                    }>Reply</div>)}

                    {canEdit &&  (<div 
                    className="comment-action"
                    onClick={()=> setActiveComment({ id:comment.id,type:"editing"})}
                    >Edit</div>)}

                    {canDelete && (
                        <div
                        className="comment-action"
                        onClick={() => deleteComment(comment.id)}
                        >
                        Delete
                        </div>
                    )}
                </div>

            </div>
            {isReplying && (
            <CommentForm
              submitLabel="Reply"
              handleSubmit={(text) => addComment(text, replyId)}
            />
          )}
        </div>
        <div className="ml-6">
            {replies.length > 0 && (
                <div  className="">
                    {replies.map(reply => (
                        <Comment 
                        comment={reply} 
                        key={reply.id} 
                        replies={[]} 
                        currentUserId={currentUserId}
                        deleteComment = {deleteComment}
                        updateComment={updateComment}
                        addComment={addComment}
                        activeComment={activeComment}
                        setActiveComment={setActiveComment}
                        parentId={comment.id}
                        />
                    ))}
                </div>
            )}
        </div>
        </div>
    )
}

export default Comment